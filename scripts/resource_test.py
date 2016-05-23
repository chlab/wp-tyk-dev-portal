import ckanapi
import requests
import tempfile
import shutil
import os
import smtplib
import re
from pprint import pprint
from email.mime.text import MIMEText

### Preferences
remote_ckan_url_prod = 'https://opendata.swiss/'
remote_ckan_url_abna = 'http://ogdch-abnahme.clients.liip.ch/'

remote_ckan_url = remote_ckan_url_prod
ogdremote = ckanapi.RemoteCKAN(remote_ckan_url)

from_mail = 'no-reply@opendata.swiss'

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

def prepare_mail(contact_points, url, error_msg):
    for contact in pkg['contact_points']:
        receiver_mail = 'test'+contact['email']+'1234' #contact['email']
        receiver_name = contact['name']

        fname = mail_dir + '/' + receiver_mail
        msg = ''
        if(not os.path.isfile(fname)):
            msg+= 'Hello ' + receiver_name + '!\n\n'
            msg+= 'While accessing the following resources, we found some unexpected behaviour.\n'
            msg+= 'Please check if those resources are still available.\n\n'
        #else:
        #    mailbody = open(fname, 'r')
        #    if url in mailbody:
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
        msg['To'] = 'stefanie.taepke@liip.ch' #filename

        s = smtplib.SMTP('localhost', 1025)
        s.sendmail(filename, 'stefanie.taepke@liip.ch', msg.as_string())
        s.quit()

### Execution
for id in pkgs[300:400]: # for id in pkgs:
    check_package(id)

### Testing
#check_package('adresses-georeferencees-a-lentree-du-batiment')
#check_package('larmbelastung-durch-eisenbahnverkehr-nacht')
#check_package('677')
send_mails()

### Tear Down
#shutil.rmtree(tmp_dir)
