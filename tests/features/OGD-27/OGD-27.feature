#language: de
@finished
Funktionalität: Als Datenlieferant (technisch) möchte ich einem von mir manuell erstellten Datensatz einen Status zuordnen, so dass sein Publikationsstatus bekannt ist.

Hintergrund:
  Angenommen ein Admin-Back-End genannt Admin
  Und eine Datenlieferantin Namenes Priska
  Und einen Data-Owner Namens Alain
  Und eine öffentliche Datensatz-Suche genannt opendata.swiss
  Und ein unregistrierter Benutzer Namens Oleg

Szenario: Der Daten-Lieferant validiert einen Datensatz.
  Angenommen Priska hat einen Datensatz "Niederschlag" erfasst
  Und dieser befindet sich im Status "in Bearbeitung"
  Dann ist dieser nicht auffindbar auf opendata.swiss
  Und Priska ändert den Status auf "validiert"
  Dann ist dieser nicht auffindbar auf opendata.swiss

Szenario: Der Daten-Lieferant zieht einen publizierten Datensatz zurück.
  Angenommen Priska hat einen Datensatz "Niederschlag" erfasst
  Und Priska ändert den Status auf "publiziert"
  Dann ist dieser auffindbar auf opendata.swiss
  Und Priska ändert den Status auf "in Bearbeitung"
  Dann befindet sich dieser im Status "in Bearbeitung"
  Dann ist dieser nicht auffindbar auf opendata.swiss
