"""
Resource Testing.

Test resource-links of all packages of the configured CKAN URL for the given environment-file.
Generates a tmp-folder containing a log-file and a mail-folder if URLs of the resources were not accessible.

Usage:
    resource_test.py -c path-to-development.ini [--dry]
    resource_test.py -h | --help

Options:
    -h, --help                    Show this help message and exit.
    -c, --config <path-to-ini>    Path to configuration-file, e.g. /var/www/development.ini
    -d, --dry                     a.k.a. Debug. Run Tests, generate Error-Mails without sending them.
    --version                     Show the version and exit.

Example:
    resource_test.py -c ../web/ckan/development.ini
"""

import ckanapi
import requests
import tempfile
import shutil
import os
import smtplib
import re
from docopt import docopt

from pprint import pprint
from email.mime.text import MIMEText
from ConfigParser import ConfigParser



FROM_MAIL = 'error_email_from'
SITE_URL = 'ckan.site_url'
SMTP_SERVER = 'smtp.server' # = localhost
SMTP_HOST = 'smtp.host' # = 1025


### Functions
def check_status(url, pkg):
    log.write('URL ' + str(url) + ' ')

    if url_pattern.match(url):
        log.write('Harvester URL ignored.\n')
        return
    try:
        req = requests.head(url)
        req.raise_for_status()
        log.write('sent response ' + str(req.status_code) + '\n')
    except requests.exceptions.HTTPError as e:
        log.write(str(e) + '\n')
        if 405 != e.response.status_code:
            prepare_mail(pkg, url, str(e))
    except (ValueError, requests.exceptions.RequestException, requests.exceptions.ConnectionError) as e:
        log.write('\n EXCEPTION OCCURED: \n' + str(e) + '\n')
        # prepare_mail(pkg, url, str(e))

def prepare_mail(pkg, url, error_msg):
    for contact in pkg['contact_points']:
        receiver_mail = 'test'+contact['email']+'1234' #contact['email']
        receiver_name = contact['name']

        fname = mail_dir + '/' + receiver_mail
        msg = ''
        if(not os.path.isfile(fname)):
            msg+= 'Hello ' + receiver_name + '!\n\n'
            msg+= 'While accessing the following resources, we found some unexpected behaviour.\n'
            msg+= 'Please check if those resources are still available.\n\n'
        msg+= 'Dataset [' + pkg['name'] + ']: \n'
        msg+= error_msg + '\n\n'
        mail = open(fname, 'a')
        try:
            mail.write(msg.encode('utf8'))
        except:
            pprint('failed to write mail: ' + msg + '\n')

def check_package(package_id):
    log.write('Package ID: [' + package_id + ']\n')
    pkg = ogdremote.action.package_show(id=package_id)

    for resource in pkg['resources']:
        url = resource['url']
        download_url = resource['download_url']

        if url:
            check_status(url, pkg)
        if download_url and download_url != url:
            check_status(download_url, pkg)

def send_mails():
    for filename in os.listdir(mail_dir):
        fp = open(mail_dir + filename, 'rb')
        msg = MIMEText(fp.read())

        msg['Subject'] = 'Information'
        msg['From'] = from_mail
        msg['To'] = filename

        smtp_host = config.get('app:main', SMTP_SERVER)
        smtp_port = config.get('app:main', SMTP_HOST)

        s = smtplib.SMTP(smtp_host, smtp_port)
        s.sendmail(filename, filename, msg.as_string())
        s.quit()

### Execution
if __name__ == '__main__':

    # Parse the configuration
    arguments = docopt(__doc__)

    config = ConfigParser()
    config.read(arguments['--config'])

    remote_ckan_url = config.get('app:main', SITE_URL, '')
    ogdremote = ckanapi.RemoteCKAN(remote_ckan_url)

    from_mail = config.get('app:main', FROM_MAIL, '')

    ### Setup
    tmp_dir = tempfile.mkdtemp()
    mail_dir = tmp_dir + '/mails/'
    os.makedirs(mail_dir)
    pprint(tmp_dir)
    log = open(tmp_dir + '/log.txt', 'w')
    log.write('Checking Resource-Links of ' + remote_ckan_url + '\n\n')
    url_pattern = re.compile('^(http://)?(-)?$')

    ### Fetch Data
    pkgs = ogdremote.action.package_list()

    for id in pkgs: #for id in pkgs[300:400]:
        check_package(id)

    if not arguments['--dry']:
        send_mails()

        ### Tear Down
        shutil.rmtree(tmp_dir)
        log.write('DONE. Tmp-Folder deleted.')
    else:
        log.write('DONE. No mails sent.')