#language: de
Funktionalität: Als Content-Manager möchte ich statische Inhalte bearbeiten, so dass angebotene Zusatzinformationen jederzeit aktuell gehalten werden können.

Hintergrund:
  Angenommen ein Admin-Back-End genannt Admin
  Und ein Content-Manager Namens Simon
  Und eine öffentliche Site Namens opendata.swiss
  Und eine Startseite
  Und eine Datenseite

Szenario: Aktualisieren der Informationen im Footer
  Angenommen der Footer von opendata.swiss ist leer
  Und Simon bearbeitet den Footer im Admin
  Und schreibt "Haben Sie Fragen zu opendata.swiss?" für de
  Und schreibt "Vous avez des questions au sujet de opendata.swiss?" für fr
  Dann erscheint dieser Text am Seitenende der Startseite in der jeweiligen Spracheinstellung
  Und ebenso am Seitenende der Datenseite
