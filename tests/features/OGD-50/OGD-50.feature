#language: de
Funktionalität: Als Data-Owner möchte ich auf meinem bestehenden Daten-Portal bereit gestellte Datensätze über eine standardisierte Schnittstelle auch auf OGD-CH veröffentlichen, so dass die Unterstützung des Portals meinerseits keinen zusätzlichen Aufwand erzeugt.

Hintergrund:
  Angenommen ein Data-Owner Namens Alain
  Und ein bestehendes Daten-Portal "Data.Stadt-Zuerich.ch"
  Und das Portal opendata.swiss
  Und der Datensatz "Niederschlag_Zuerich" auf dem Portal "Data.Stadt-Zuerich.ch"

Szenario: Alain veröffentlicht neuen Datensatz via Schnittstelle
Angenommen Alain veröffentlicht den neuen Datensatz "Niederschlag_Zuerich" aus seinem Portal "Data.Stadt-Zuerich.ch" über eine Schnittstelle auf opendata.swiss.
Dann ist der neue Datensatz "Niederschlag_Zuerich" ist mit den neuen Metadaten erstellt
Und "Niederschlag_Zuerich" ist publiziert

Szenario: Alain aktualisiert Datensatz via Schnittstelle
Angenommen Alain aktualisiert den Datensatz "Niederschlag_Zuerich" auf seinem Portal "Data.Stadt-Zuerich.ch".
Dann wird dieser Datensatz auf dem Portal opendata.swiss mit den neuen Metadaten aktualisiert.
