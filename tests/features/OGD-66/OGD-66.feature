#language: de
Funktionalität: Als Application-Owner möchte ich, dass OGD-CH das DCAT-AP Switzerland Format unterstützt, so dass weitere Daten-Lieferanten einfach an das System angebunden werden können.

Hintergrund:
  Angenommen ein Admin-Back-End genannt Admin
  Und einen Data-Owner namens Alain
  Und einen Datenlieferant namens Priska
  Und Metadaten im Format DCAT-AP Switzerland ((file))
  Und ein unregistrierter Benutzer Namens Oleg

Szenario: Der Datenlieferant lädt einen Datensatz mit einem File-Upload hoch.
  Angenommen Priska hat ein Metadaten-File hochgeladen
  Und dieses befindet sich nun im Status "in Bearbeitung"
  Und opendata.swiss zeigt es noch nicht an
  Und Alain ändert den Status auf "validiert"
  Dann zeigt opendata.swiss es weiterhin nicht an.
