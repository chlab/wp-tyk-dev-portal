#language: de

# Frage: Wodurch sind Struktur und Übersichtlichkeit betroffen?
Funktionalität: Als Application-Manager möchte ich die im System verfügbaren Organisationen und Unterorganisationen bearbeiten, so dass die Struktur und Übersichtlichkeit des Portals aufrecht erhalten werden

Hintergrund:
  Angenommen ein Admin-Back-End genannt Admin
  Und einen Service-Manager Namens Pierre
  Und eine Organisation Namens ACME
  Und eine Tochter-Organisation Namens ACME Fireworks
  Und ein Data-Owner von ACME Fireworks Namens Wile

Szenario: Pierre erstellt eine neue Organisation.
  Angenommen bisher existieren noch keine Organisationen
  Und Pierre erfasst ACME
  Dann existiert im Admin eine Organisation
  Und diese heisst ACME

Szenario: Pierre erstellt eine Tochter-Organisation.
  Angenommen ACME hat noch keine Tochterorganisation
  Und Pierre erfasst ACME Fireworks als Tochter von ACME
  Dann existieren im Admin zwei Organisationen
  Und davon eine als Tochter von ACME
