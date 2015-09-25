#language: de
@finished
Funktionalität: Als Datenlieferant (technisch) möchte Schreib-Zugriff auf die Datensätze meiner Organisation haben, damit ich Änderungen vornehmen kann.

Hintergrund:
  Angenommen eine Datenlieferantin namens Priska
  Und ein Admin-Bereich existiert

Szenario: Priska hat die Rechte um die Datensätze ihrer Organisation zu ändern
  Angenommen Alain hat einen Datensatz "Geodaten XY" erfasst
  Und dieser befindet sich im Status "in Bearbeitung"
  Dann kann Priska den Titel auf "Geodaten AB" ändern

Szenario: Priska hat die keine Rechte um die Datensätze anderer Organisationen zu ändern
  Angenommen Pierre hat einen Datensatz "Archivdaten XY" erfasst
  Und dieser befindet sich im Status "in Bearbeitung"
  Dann kann Priska diesen Datensatz nicht bearbeiten