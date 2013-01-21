# -*- coding: utf-8 -*-
import sqlite3

def iterdump(connection):
    cu = connection.cursor()
    yield(u'BEGIN TRANSACTION;')

    q = """
        SELECT "name", "type", "sql"
        FROM "sqlite_master"
            WHERE "sql" NOT NULL AND
            "type" == 'table'
        """
    schema_res = cu.execute(q)
    for table_name, type, sql in sorted(schema_res.fetchall()):
        if table_name == 'sqlite_sequence':
            yield(u'DELETE FROM "sqlite_sequence";')
        elif table_name == 'sqlite_stat1':
            yield(u'ANALYZE "sqlite_master";')
        elif table_name.startswith('sqlite_'):
            continue
        else:
            yield(u'{0};'.format(sql))

        table_name_ident = table_name.replace('"', '""')
        res = cu.execute('PRAGMA table_info("{0}")'.format(table_name_ident))
        column_names = [str(table_info[1]) for table_info in res.fetchall()]
        q = """SELECT 'INSERT INTO "{0}" VALUES({1})' FROM "{0}";""".format(
            table_name_ident,
            ",".join("""'||quote("{0}")||'""".format(col.replace('"', '""')) for col in column_names))
        query_res = cu.execute(q)
        for row in query_res:
            yield(u"{0};".format(row[0]))

    q = """
        SELECT "name", "type", "sql"
        FROM "sqlite_master"
            WHERE "sql" NOT NULL AND
            "type" IN ('index', 'trigger', 'view')
        """
    schema_res = cu.execute(q)
    for name, type, sql in schema_res.fetchall():
        yield(u'{0};'.format(sql))

    yield(u'COMMIT;')

def main():
    con = sqlite3.connect('cityapp.db')
    with open('dump.sql', 'w') as f:
        for line in iterdump(con):
            f.write('%s\n' % line.encode('utf8'))


if __name__ == "__main__":
    main()