# coding=utf-8
import requests
import xml.dom.minidom

DIRECT_URL = 'http://52.59.12.146:8889/sbb/trias'
TYK_URL = 'http://odpch-api.begasoft.ch/trias/'
TYK_API_KEY = '576a42fc17f89d0001000001cd8959a5f2254b824257edba585edfcd'


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

TRIP_REQUEST = """
<Trias version="1.1" xmlns="http://www.vdv.de/trias" xmlns:siri="http://www.siri.org.uk/siri" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
    <ServiceRequest>
        <siri:RequestTimestamp>2016-07-05T18:00:00</siri:RequestTimestamp>
        <siri:RequestorRef>JS</siri:RequestorRef>
        <RequestPayload>
            <TripInfoRequest>
                <JourneyRef>sbb:01012::H:j16:30441</JourneyRef>
                <OperatingDayRef>2016-04-02T</OperatingDayRef>
                <Params>
                    <!-- <UseTimetabledDataOnly>false</UseTimetabledDataOnly> -->
                    <IncludeCalls>true</IncludeCalls>
                    <IncludePosition>false</IncludePosition>
                    <IncludeService>true</IncludeService>
                </Params>
            </TripInfoRequest>
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


def test_stop_event_direct():
    assert trias(DIRECT_URL).status_code == 200


def test_stop_event_tyk():
     assert trias(TYK_URL, auth=TYK_API_KEY).status_code == 200


def test_trip_request_direct():
    assert trias(DIRECT_URL).status_code == 200


def test_trip_request_tyk():
     assert trias(TYK_URL, auth=TYK_API_KEY).status_code == 200
