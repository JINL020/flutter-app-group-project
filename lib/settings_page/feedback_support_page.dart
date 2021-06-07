import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/colors.dart';
import 'package:hci_m3_app/info_page/buttonTextbox.dart';
import 'package:hci_m3_app/model/alarm_settings.dart';
import 'package:provider/provider.dart';

class FeedBackSupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isAlarm = Provider.of<AlarmSettings>(context).isAlarm;
    final primaryColor =
        isAlarm ? AppColors.backgroundRed : AppColors.backgroundBlue;

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text("Feedback & Support"),
      ),
      body: Stack(
        children: [
          AppColors.backgroundGradient,
          ListView(
            children: [
              SizedBox(height: 20),
              ButtonTextBoxWidget(
                title: "Das Team",
                content: [
                  "Das Team Sicha setzt sich aus folgenden Personen zusammen:",
                  "   - Addi Walla",
                  "   - Jin-Jin Lee",
                  ""
                ],
                buttonName: null,
                action: null,
              ),
              ButtonTextBoxWidget(
                title: "Feedback & Support",
                content: [
                  "Du hast Fragen oder Feedback?",
                  "Hier kannst du mit unserem Team chatten."
                ],
                buttonName: "Jetzt schreiben",
                action: null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
