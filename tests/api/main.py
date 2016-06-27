# coding=utf-8
import requests
import xml.dom.minidom

TYK_API_KEY = '576a42fc17f89d0001000001cd8959a5f2254b824257edba585edfcd'

LOCATION_INFORMATION_REQUEST = """<?xml version="1.0" encoding="iso-8859-1" ?>
<Trias xmlns="trias" xmlns:siri="http://www.siri.org.uk/siri" version="1.0">
    <ServiceRequest>
        <siri:RequestTimestamp>2016-04-25T15:06:58</siri:RequestTimestamp>
        <siri:RequestorRef>LIIP</siri:RequestorRef>
        <RequestPayload>
            <LocationInformationRequest>
                <InitialInput>
                    <LocationName>Bern, Hauptbahnhof</LocationName>
                 </InitialInput>
             </LocationInformationRequest>
         </RequestPayload>
    </ServiceRequest>
</Trias>
"""

# DIDOK Data:
# 8507785 Bern Hauptbahnhof
# 8503000 Zürich Hauptbahnhof

TRIP_REQUEST = """<?xml version="1.0" encoding="iso-8859-1" ?>
<Trias xmlns="trias" xmlns:siri="http://www.siri.org.uk/siri" version="1.0">
    <ServiceRequest>
        <siri:RequestTimestamp>2016-04-25T15:06:58</siri:RequestTimestamp>
        <siri:RequestorRef>LIIP</siri:RequestorRef>
        <RequestPayload>
            <TripRequest>
                <Origin>
                    <StopPlaceRef>8507785</StopPlaceRef>
                </Origin>
                <Destination>
                    <StopPlaceRef>8503000</StopPlaceRef>
                </Destination>
             </TripRequest>
         </RequestPayload>
    </ServiceRequest>
</Trias>
"""


def format_xml(xml_text):
    dom = xml.dom.minidom.parseString(xml_text)
    return dom.toprettyxml()


def trias(url, auth=None):
    headers = {}
    if auth:
        headers['Authorization'] = auth
    return requests.post(url, data=LOCATION_INFORMATION_REQUEST, headers=headers, timeout=10)


def test_trias1_direct():
    assert trias('http://52.59.12.146:8888/Middleware/Data/trias').status_code == 400


def test_trias2_direct():
    assert trias('http://52.59.12.146:8889/Middleware/Data/trias').status_code == 200


def test_trias1_tyk():
    assert trias('http://odpch-api.begasoft.ch/trias1/Middleware/Data/trias', auth=TYK_API_KEY).status_code == 400


def test_trias2_tyk():
    assert trias('http://odpch-api.begasoft.ch/trias2/Middleware/Data/trias', auth=TYK_API_KEY).status_code == 200
