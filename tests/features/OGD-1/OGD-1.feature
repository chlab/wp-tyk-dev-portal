Feature: Als Service-Entwickler oder Daten-Analyst möchte ich alle Datensätze mit einer einzigen Suchabfrage nach sämtlichen verfügbaren Attributen durchsuchen können, so dass ich mir nicht überlegen muss, in welchem Feld ein Stichwort vorkommen könnte.

Hintergrund:
  Angenommen ein Service-Entwickler Namens Benjamin
  Und eine öffentliche Datensatz-Suche genannt opendata.swiss
  Und mindestens ein publizierter Datensatz mit einem Attributwert "Dietlikon"

Szenario: Benjamin sucht nach Daten der Gemeinde Dietlikon
  Angenommen Benjamin schreibt in das grosse Suchfeld auf opendata.swiss "Dietlikon"
  Und klickt auf "Durchsuchen"
  Dann werden ihm alle Datensätze mit einem Attributwert "Dietlikon" angezeigt
  Und das ist mindestens ein Datensatz
