# language: de
Funktionalität: Example feature
  As a user of cucumber.js
  I want to have documentation on cucumber
  So that I can concentrate on building awesome applications

  Hintergrund:
    Gegeben sei a user called I
    Und a website named Google (www.google.com)

  Szenario: Reading documentation Google
    Gegeben sei I am on the Google home page
    Wenn I do nothing
    Dann I should see "Google" as the page title

  Szenario: Reading documentation Local
    Gegeben sei I am on the ogdch.dev/en/dataset page
    Wenn I do nothing
    Dann I should see "Datasets - CKAN" as the page title
