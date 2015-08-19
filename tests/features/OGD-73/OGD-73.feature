#language: de
Feature: Als Data-Owner möchte ich die Beschreibung meiner Organisationen bearbeiten, so dass die Informationen auf OGD-CH aussagekräftig sind.

Hintergrund:
  Angenommen ein Admin-Back-End genannt Admin
  Und einen Data-Owner Namens Alain
  Und ein öffentliches Portal genannt opendata.swiss
  Und ein unregistrierter Benutzer Namens Oleg

Szenario: Alain möchte für seine Organisation ein neues Logo einfügen
  Angenommen es besteht ein Logo 'logo-alt.png'
  Und es ist unter opendata.swiss sichtbar
  Wenn Alain im Admin ein neues Logo 'logo-neu.png' einfügt
  Dann ist unter opendata.swiss das neue Logo ersichtlich

Szenario: Alain möchte die Beschreibung seiner Organisation ändern.
