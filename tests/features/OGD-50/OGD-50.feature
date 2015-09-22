#language: de
Funktionalität: Als Data-Owner möchte ich auf meinem bestehenden Daten-Portal bereit gestellte Datensätze über eine standardisierte Schnittstelle auch auf OGD-CH veröffentlichen, so dass die Unterstützung des Portals meinerseits keinen zusätzlichen Aufwand erzeugt.

Hintergrund:
  Angenommen ein Data-Owner namens Alain
  Und ein bestehendes im Web zugängliches Drittsystem "Statistik Portal Schweiz (BFS)"
  Und das Portal opendata.swiss
  Und der Datensatz "Bevölkerungsdaten im europäischen Vergleich" auf dem Portal "Statistik Portal Schweiz (BFS)"

Szenario: Alain veröffentlicht einen neuen Datensatz via Schnittstelle
Angenommen Alain veröffentlicht den neuen Datensatz "Bevölkerungsdaten im europäischen Vergleich" aus seinem Portal "Statistik Portal Schweiz (BFS)" über eine Schnittstelle auf opendata.swiss.
Dann ist der neue Datensatz "Bevölkerungsdaten im europäischen Vergleich" mit den neuen Metadaten erstellt
Und "Bevölkerungsdaten im europäischen Vergleich" ist auf opendata.swiss publiziert.

Szenario: Alain aktualisiert Datensatz via Schnittstelle
Angenommen Alain aktualisiert den Datensatz "Bevölkerungsdaten im europäischen Vergleich" auf seinem Portal "Statistik Portal Schweiz (BFS)".
Dann wird dieser Datensatz auf dem Portal opendata.swiss mit den neuen Metadaten aktualisiert.
