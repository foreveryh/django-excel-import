#!/usr/bin/env python
import logging
import os
import subprocess
import sys

logger = logging.getLogger(u'virtualenvwrapper.django')


def create_project(project_name):
    project_template = os.path.join(os.path.dirname(__file__), 'templates', 'project_template')

    # Create a git-flow repository
    logger.info(u'Initialising git repo')
    subprocess.check_call(['git', 'init'])
    subprocess.check_call(['git', 'flow', 'init', '-d'])

    # Readline needs to be installed via `easy_install` or ipython gets upset
#logger.info(u'Installing readline')
# subprocess.check_call(['easy_install', 'readline'])

    # Install requirements via pip
    logger.info(u'Installing requirements')
    subprocess.check_call(['pip', 'install', '-r', os.path.join(project_template, 'requirements.txt')])

    # Create django project using our template
    logger.info(u'Creating django project')
    subprocess.check_call(['django-admin.py', 'startproject', '--template={}'.format(project_template), '-e', 'py', '-e', 'txt', project_name, os.getcwd()])

    # Commit changes to git, leaving a cleaning working environment
    logger.info(u'Committing changes')
    subprocess.check_call(['git', 'add', '.'])
    subprocess.check_call(['git', 'commit', '-m', '"[mkproject] installed Django project template"'])

    # Create a symlink in site-packages to the src dir
    logger.info(u'Creating site-packages symlinks')
    subprocess.check_call(['python', 'setup.py', 'develop'])

    logger.info(u'Done')

def main():
    project_name = raw_input('Enter project name:')
    create_project(project_name)

if __name__ == '__main__':
    main()
