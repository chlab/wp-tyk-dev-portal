#language: de
Funktionalität: Als Application-Manager möchte ich informiert werden, falls ein Importjob nicht erfolgreich abgeschlossen werden konnte, so dass ich geeignete Massnahmen ergreifen kann, um das Problem zu beheben.

Hintergrund:
Angenommen ein Application-Manager Namens Pierre
Und ein Importjob

Szenario: Pierre erhält bei fehlgeschlagenem Import eine Nachricht
Angenommen der Importjob konnte nicht erfolgreich abgeschlossen werden
Dann wird eine Nachricht/Fehlermeldung and eine definirte Stelle gesendet.
Und die Nachricht beinhaltet Informationen zum aufgetretenen Fehler.

Szenario: Pierre erhält bei fehlgeschlagenem Import eine Nachricht
Angenommen der Importjob konnte erfolgreich abgeschlossen
Dann wird keine Nachricht verschickt.
