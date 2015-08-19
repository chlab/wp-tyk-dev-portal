Feature: Als Datenlieferant (technisch) möchte ich einem von mir manuell erstellten Datensatz einen Status zuordnen, so dass sein Publikationsstatus bekannt ist.

Hintergrund:
  Angenommen ein Admin-Back-End genannt Admin
  Und eine Datenlieferantin Namenes Priska
  Und einen Data-Owner Namens Alain
  Und eine öffentliche Datensatz-Suche genannt opendata.swiss
  Und ein unregistrierter Benutzer Namens Oleg

Szenario: Der Data-Owner validiert einen Datensatz.
  Angenommen Priska hat einen Datensatz erfasst
  Und dieser befindet sich nun im Status "in Bearbeitung"
  Und opendata.swiss zeigt ihn noch nicht an
  Und Alain ändert den Status auf "validiert"
  Dann zeigt opendata.swiss ihn weiterhin nicht an.

Szenario: Die Datenlieferantin publiziert einen neuen Datensatz.
  Angenommen Priska veröffentlicht einen bisher unveröffentlichten Datensatz
  Dann befindet sich dieser anschliessend im Status "publiziert"
  Und opendata.swiss zeigt ihn an

Szenario: Die Datenlieferantin zieht einen publizierten Datensatz zurück.
  Angenommen Priska hat einen veröffentlichten Datensatz
  Und opendata.swiss zeigt ihn an
  Und Priska ändert den Status auf "in Bearbeitung"
  Dann befindet sich dieser anschliessend im Status "in Bearbeitung"
  Und opendata.swiss zeigt ihn nicht mehr an
