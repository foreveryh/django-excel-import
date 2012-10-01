#!/usr/bin/env python

from setuptools import setup, find_packages


def parse_requirements(fn):
    """ Currently only supports tarball and pypi-style requirements. """
    ir, dl = [], []
    for req in open(fn).readlines():
        req = req.strip()
        if req:
            tgt = dl if req.startswith('http') else ir
            tgt.append(req.strip())
    return ir, dl

install_requires, dependency_links = parse_requirements('requirements.txt')
setup(name=u'{{ project_name }}',
      version=u'git',
      description=u'',
      author=u'',
      author_email=u'',
      url=u'',
      install_requires=install_requires,
      dependency_links=dependency_links,
      provides=(u'{{ project_name }}',),
      packages=find_packages())
