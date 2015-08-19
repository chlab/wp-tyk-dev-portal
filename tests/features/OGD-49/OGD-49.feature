#language: de
Feature: Als Datenlieferant (technisch) möchte ich zu einem Datensatz meiner Organisation über ein Web-Frontend Metadaten erfassen und bearbeiten können, so dass dieser Datensatz ohne zusätzliche Investitionen über das Portal zugänglich ist. (OGD-49)

Hintergrund:
  Angenommen ein Admin-Back-End genannt Admin
  Und eine Datenlieferantin Namenes Priska
  Und einen Data-Owner Namens Alain
  Und eine öffentliche Datensatz-Suche genannt opendata.swiss
  Und ein unregistrierter Benutzer Namens Oleg

Szenario: Priska möchte einen neuen Datensatz zur Verfügung stellen.
  Angenommen sie verfügt bisher über drei Datensätze
  Wenn sie im Admin das Hinzufügen-Formular öffnet
  Und alle vorgeschriebenen Felder ausfüllt
  Und den neuen Datensatz abspeichert
  Dann verfügt sie neu über vier Datensätze
  Und der neue Datensatz hat den Status “in Bearbeitung”
  Und der neue Datensatz ist öffentlich nicht abrufbar

Szenario: Priska möchte einen neuen Datensatz per Upload zur Verfügung stellen.
  Angenommen sie verfügt bisher über drei Datensätze
  Wenn sie im Admin das Upload-Formular öffnet
  Und eine Datei im DCAT-AP-Format hochlädt
  Dann verfügt sie neu über vier Datensätze
  Und der neue Datensatz hat den Status “in Bearbeitung”
  Und der neue Datensatz ist unter opendata.swiss nicht abrufbar

Szenario: Alain möchte einen neuen Datensatz validieren.
  Angenommen er bearbeitet im Admin einen Datensatz mit Status “in Bearbeitung”
  Wenn er den Status zu “validiert” ändert
  Und den Datensatz dann abspeichert
  Dann hat der Datensatz den neuen Status “validiert”
  Und der Datensatz ist unter opendata.swiss nicht abrufbar
  Und

Szenario: Priska möchte einen validierten Datensatz publizieren.
  Angenommen sie bearbeitet einen Datensatz mit Status “validiert”
  Wenn sie den Status zu “publiziert” ändert
  Und den Datensatz dann abspeichert
  Dann hat der Datensatz den neuen Status “publiziert”
  Und der Datensatz ist unter opendata.swiss abrufbar
  Und

Szenario: Priska möchte eine neue Ressource hinzufügen.
  Angenommen sie bearbeitet einen Datensatz mit Status “publiziert”
  Wenn sie eine neue Ressource einträgt
  Und den Datensatz dann abspeichert
  Dann erscheint diese neue Ressource unmittelbar in der Detailview des Datensatzes unter opendata.swiss
  Und Priska sieht wieder die Übersichtsseite
