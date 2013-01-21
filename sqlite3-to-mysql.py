# -*- coding: utf-8 -*-
#! /usr/bin/env python
import re, fileinput, tempfile
from optparse import OptionParser


IGNOREDPREFIXES = [
    'PRAGMA',
    'BEGIN TRANSACTION;',
    'COMMIT;',
    'DELETE FROM sqlite_sequence;',
    'INSERT INTO "sqlite_sequence"',
]

def _replace(line):
    if any(line.startswith(prefix) for prefix in IGNOREDPREFIXES):
        return
    line = line.replace("INTEGER PRIMARY KEY", "INTEGER AUTO_INCREMENT PRIMARY KEY")
    line = line.replace("integer NOT NULL PRIMARY KEY", "INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY")
    line = line.replace("AUTOINCREMENT", "AUTO_INCREMENT")
    line = line.replace("DEFAULT 't'", "DEFAULT '1'")
    line = line.replace("DEFAULT 'f'", "DEFAULT '0'")
    line = line.replace(",'t'", ",'1'")
    line = line.replace(",'f'", ",'0'")
    return line


def _backticks(line, in_string):
    """Replace double quotes by backticks outside (multiline) strings

    >>> _backticks('''INSERT INTO "table" VALUES ('"string"');''', False)
    ('INSERT INTO `table` VALUES (\\'"string"\\');', False)

    >>> _backticks('''INSERT INTO "table" VALUES ('"Heading''', False)
    ('INSERT INTO `table` VALUES (\\'"Heading', True)

    >>> _backticks('''* "text":http://link.com''', True)
    ('* "text":http://link.com', True)

    >>> _backticks(" ');", True)
    (" ');", False)

    """
    new = ''
    for c in line:
        if not in_string:
            if c == "'":
                in_string = True
            elif c == '"':
                new = new + '`'
                continue
        elif c == "'":
            in_string = False
        new = new + c
    return new, in_string

def _process(opts, lines):
    if opts.database:
        yield '''\
drop database {d};
create database {d} character set utf8;
grant all on {d}.* to {u}@'%' identified by '{p}';
use {d};\n'''.format(d=opts.database, u=opts.username, p=opts.password)
    yield "SET sql_mode='NO_BACKSLASH_ESCAPES';\n"

    in_string = False
    for line in lines:
        if not in_string:
            line = _replace(line)
            if line is None:
                continue
        line, in_string = _backticks(line, in_string)
        yield line

def _removeNewline(line, in_string):
    new = ''
    for c in line:
        if not in_string:
            if c == "'":
                in_string = True
        elif c == "'":
            in_string = False
        elif in_string:
            if c == "\n":
                 new = new + 'Newline333'
                 continue
            if c == "\r":
                 new = new + 'carriagereturn333'
                 continue
        new = new + c
    return new, in_string
	
def _replaceNewline(lines):
    for line in lines:
           line = line.replace("Newline333", "\n")
           line = line.replace("carriagereturn333", "\r")
           yield line

def _Newline(lines):
    in_string = False
    for line in lines:
        if line is None:
           continue
        line, in_string = _removeNewline(line, in_string)
        yield line
	
def main():
    op = OptionParser()
    op.add_option('-d', '--database')
    op.add_option('-u', '--username')
    op.add_option('-p', '--password')
    opts, args = op.parse_args()
    lines = (l for l in fileinput.input(args))
    lines = (l for l in _Newline(lines))
    f = tempfile.TemporaryFile()
    for line in lines:
        f.write(line)
    f.seek(0)
    lines = (l for l in f.readlines())
    f.close()
    lines = (l for l in _process(opts, lines))
    with open('data.sql', 'w') as fp:
        for line in _replaceNewline(lines):
            fp.write(line)
    fp.close()


if __name__ == "__main__":
    main()
