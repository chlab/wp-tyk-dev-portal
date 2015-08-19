#language: de
Feature: Als Application-Manager will ich einem manuell erstellten und publizierten Datensatz einen Status zuordnen, damit ich der Anfrage eines Daten-Owners nach Rückzug des Datensatzes entsprechen kann.

Hintergrund:
  Angenommen ein bestimmter Datensatz Siedlungsdichte
  Und eine Datenlieferantin Namenes Priska
  Und einen Service-Owner Namens Pierre
  Und eine öffentliche Datensatz-Suche genannt opendata.swiss

Szenario: Priska möchte den Datensatz zurückziehen
  Angenommen Siedlungsdichte befindet sich im Status "publiziert"
  Und Siedlungsdichte ist auffindbar auf opendata.swiss
  Dann kann Priska den Datensatz nicht zurückziehen

Szenario: Pierre möchte den Datensatz zurückziehen
  Angenommen Siedlungsdichte befindet sich im Status "publiziert"
  Und Siedlungsdichte ist auffindbar unter opendata.swiss
  Und Pierre ändert den Status von Siedlungsdichte auf "in Bearbeitung"
  Dann ist Siedlungsdichte nicht mehr auffindbar auf opendata.swiss
