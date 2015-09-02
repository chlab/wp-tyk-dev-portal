#language: de

Funktionalität: Als Application-Manager möchte ich die im System verfügbaren Organisationen und Unterorganisationen bearbeiten, so dass die Struktur und Übersichtlichkeit des Portals aufrecht erhalten werden

Hintergrund:
  Angenommen ein Admin-Back-End genannt Admin
  Und einen Application-Manager Namens Pierre
  Und eine Organisation Namens "Kanton Zürich"
  Und eine Tochter-Organisation Namens "GIS ZH"
  Und ein Data-Owner von "GIS ZH" Namens Paul

Szenario: Pierre erstellt eine neue Organisation.
  Angenommen bisher existiert noch keine Organisation "Kanton Zürich"
  Und Pierre erfasst "Kanton Zürich"
  Dann existiert im Admin eine Organisation namens "Kanton Zürich"

Szenario: Pierre erstellt eine Tochter-Organisation.
  Angenommen "Kanton Zürich" hat noch keine Tochterorganisation
  Und Pierre erfasst "GIS ZH" als Tochter von "Kanton Zürich"
  Dann existieren im Admin zwei Organisationen namens "Kanton Zürich" und "GIS ZH"
  Und davon eine als Tochter von "Kanton Zürich"

Szenario: Pierre ordnet eine bestehende Tochter-Organisation einer anderen Organisation zu.

Szenario: Pierre löscht eine bestehende Organisation oder Tocher-Organisation.
