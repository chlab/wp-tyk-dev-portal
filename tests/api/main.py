# coding=utf-8
import requests
import xml.dom.minidom

TYK_API_KEY = '576a42fc17f89d0001000001cd8959a5f2254b824257edba585edfcd'

# DIDOK Data:
# 8502113 Aarau
# 8507785 Bern Hauptbahnhof
# 8503000 Zürich Hauptbahnhof

STOP_EVENT_REQUEST = """<?xml version="1.0" encoding="UTF-8"?>
<Trias version="1.1" xmlns="http://www.vdv.de/trias" xmlns:siri="http://www.siri.org.uk/siri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <ServiceRequest>
        <siri:RequestTimestamp>2016-06-27T13:34:00</siri:RequestTimestamp>
        <siri:RequestorRef>EPSa</siri:RequestorRef>
        <RequestPayload>
            <StopEventRequest>
                <Location>
                    <LocationRef>
                        <StopPointRef>8502113</StopPointRef>
                    </LocationRef>
                </Location>
                <Params>
                    <NumberOfResults>30</NumberOfResults>
                    <StopEventType>departure</StopEventType>
                    <IncludePreviousCalls>true</IncludePreviousCalls>
                    <IncludeOnwardCalls>true</IncludeOnwardCalls>
                </Params>
            </StopEventRequest>
        </RequestPayload>
    </ServiceRequest>
</Trias>
"""


def format_xml(xml_text):
    dom = xml.dom.minidom.parseString(xml_text)
    return dom.toprettyxml()


def trias(url, auth=None):
    headers = {'Content-Type': 'text/xml'}
    if auth:
        headers['Authorization'] = auth
    return requests.post(url, data=STOP_EVENT_REQUEST, headers=headers, timeout=10)


# def test_trias1_direct():
#    assert trias('http://52.59.12.146:8888/Middleware/Data/trias').status_code == 400


def test_trias2_direct():
    assert trias('http://52.59.12.146:8889/sbb/trias').status_code == 200


# def test_trias1_tyk():
#    assert trias('http://odpch-api.begasoft.ch/trias1/sbb/trias', auth=TYK_API_KEY).status_code == 400


# def test_trias2_tyk():
#     assert trias('http://odpch-api.begasoft.ch/trias2/sbb/trias', auth=TYK_API_KEY).status_code == 200
