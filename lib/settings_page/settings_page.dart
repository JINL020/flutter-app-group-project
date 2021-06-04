import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hci_m3_app/info_page/buttonTextbox.dart';
import 'package:hci_m3_app/model/alarm_settings.dart';
import 'package:hci_m3_app/settings_page/feedback_support_page.dart';
import 'package:hci_m3_app/settings_page/license_page.dart';
import 'package:hci_m3_app/settings_page/setting_options.dart';

import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage>
    with AutomaticKeepAliveClientMixin {
  // AutomaticKeepAliveClientMixin saves the screen state enabling us to switching back and forth

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final pressedAlarm = Provider.of<AlarmSettings>(context).pressedAlarm;
    final isVibration = Provider.of<AlarmSettings>(context).isVibration;
    final isFlashLight = Provider.of<AlarmSettings>(context).isFlashLight;
    final isPushNotification =
        Provider.of<AlarmSettings>(context).isPushNotification;
    final isLocation = Provider.of<AlarmSettings>(context).isLocation;
    final isMicrofon = Provider.of<AlarmSettings>(context).isMicrophone;
    final setOffAlarm =
        Provider.of<AlarmSettings>(context, listen: false).setOffAlarm;
    final toggleVibration =
        Provider.of<AlarmSettings>(context, listen: false).toggleVibration;
    final toggleFlashLight =
        Provider.of<AlarmSettings>(context, listen: false).toggleFlashLight;
    final togglePushNotification =
        Provider.of<AlarmSettings>(context, listen: false)
            .togglePushNotification;
    final toggleLocation =
        Provider.of<AlarmSettings>(context, listen: false).toggleLocation;
    final toggleMicrophone =
        Provider.of<AlarmSettings>(context, listen: false).toggleMicrophone;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Einstellungen"),
          actions: [popUpMenu()],
        ),
        body: ListView(
          children: [
            SizedBox(height: 20),
            SettingOtions(
              title: "Art der Alarm-Benachrichtigung:",
              tileNames: ["Push-Benachrichtigung", "Vibration", "Kamera Blitz"],
              tileValues: [isPushNotification, isVibration, isFlashLight],
              tileActions: [
                togglePushNotification,
                toggleVibration,
                toggleFlashLight
              ],
            ),
            Divider(),
            SettingOtions(
              title: "Zugriff erlauben auf:",
              tileNames: ["Standortinformation", "Mikrofon"],
              tileValues: [isLocation, isMicrofon],
              tileActions: [toggleLocation, toggleMicrophone],
            ),
            Divider(),
            ButtonTextBoxWidget(
                title: "Warnung!",
                content: [
                  "Die App kann ohne Zugriff auf das Mikrofon nur durch eine konstante Internetverbindung operieren. Um die integrierte Kartenfunktion nützen zu können müssen Sie außerdem Ihre Standordinformationen und Internet aktivieren. Das Deaktivieren dieser Optionen kann zu einer verminderten Sicherheit führen!",
                ],
                buttonName: null,
                action: null),
            Divider(),
            ButtonTextBoxWidget(
              title: "Probealarm testen",
              content: [
                "Testen Sie die Funktionalität der App indem Sie selbst einen Testalarm auslösen. Mit einen Klick auf den untenstehenden Button, wird nach 5 Sekunden ein Testalarm ausgelöst. Durch nochmaliges Klicken können Sie wieder in den Normalzustand wechseln."
              ],
              buttonName: pressedAlarm ? null : "Jetzt testen",
              action: pressedAlarm ? null : setOffAlarm,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget popUpMenu() {
    return PopupMenuButton(
      onSelected: (page) => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => page)),
      itemBuilder: (context) => <PopupMenuEntry<Widget>>[
        PopupMenuItem(
          value: FeedBackSupportPage(),
          child: Text("Feedback & support"),
        ),
        PopupMenuDivider(),
        PopupMenuItem(
          value: MyLicensePage(),
          child: Text("Lizenzen"),
        ),
      ],
    );
  }
}
