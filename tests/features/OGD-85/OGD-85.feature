#language: de
@finished
Funktionalität: Als Application-Manager will ich einem manuell erstellten und publizierten Datensatz einen Status zuordnen, damit ich der Anfrage eines Daten-Owners nach Rückzug des Datensatzes entsprechen kann.

Hintergrund:
  Angenommen ein bestimmter Datensatz "Siedlungsdichte"
  Und eine Datenlieferantin Namenes Priska
  Und einen Service-Owner Namens Pierre
  Und eine öffentliche Datensatz-Suche genannt opendata.swiss

Szenario: Priska möchte den Datensatz zurückziehen
  Angenommen Priska hat einen Datensatz "Siedlungsdichte" erfasst
  Und Priska ändert den Status auf "publiziert"
  Dann ist dieser auffindbar auf opendata.swiss
  Und Priska ändert den Status auf "in Bearbeitung"
  Dann ist dieser nicht auffindbar auf opendata.swiss

Szenario: Pierre möchte den Datensatz zurückziehen
  Angenommen Priska hat einen Datensatz "Siedlungsdichte" erfasst
  Und Priska ändert den Status auf "publiziert"
  Dann ist dieser auffindbar auf opendata.swiss
  Und Pierre ändert den Status auf "in Bearbeitung"
  Dann ist dieser nicht auffindbar auf opendata.swiss
