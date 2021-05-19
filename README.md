## Readme - M3

* Gruppe:	[16:45]
* Team-Nr.: 212
* Projektthema: Alarmsystem für gehörlose Universitätsangehörige

### Implementierung

Framework:	[Flutter]

API-Version:	[Android API-Level 30]

Gerät(e), auf dem(denen) getestet wurde:
[Pixel2, Huawei P10 Lite, Samsung A51, Samsung Galaxy J6]

Externe Libraries und Frameworks:
[flutter_local_notifications, provider, vibration, flashlight, logger]

Dauer der Entwicklung:
[60 Stunden]

Weitere Anmerkungen:

Im Rahmen der Meilenstein 3 Abgabe ist es noch nicht möglich einen Feueralarm remote über das Internet zu pushen. Allerdings könnte die App mit Firebase Cloud Messaging erweitert werden sodass auch diese Funktion in der Zukunft unterstützt wird.

Damit Sie trotzdem die App testen können, haben wir in der Einstellungspage einen Probealarm-Button eingerichtet. Wenn Sie diesen Button drücken, dann wechselt das Handy nach 5 Sekunden in den Alarmmodus.

Gemäß des 2-Sinne-Prinzip bieten wir den Usern mehrere Benachrichtigunsarten, unter anderen auch Benachrichtigung über Vibration und Handyblitz an. Die App sollte daher auf einem echten Handy getestet werden und nicht auf einem Emulator, wenn Sie die volle Funktionalität sehen wollen.

Beim Alarmfall könnte es sein, dass Ihr Handy trotz ausgeschalteter Vibration vibriert. Dies geschieht, weil die Push-Benachrichtigung, Ihre Handyeinstellungen übernimmt. Um die Vibration vollkommen auszuschalten, muss daher sowohl das Handy auf stumm, als auch die Vibration ausgeschalten werden.