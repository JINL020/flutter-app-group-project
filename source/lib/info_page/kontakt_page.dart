import 'package:flutter/material.dart';

import 'buttonTextbox.dart';

class KontaktPage extends StatelessWidget {
  const KontaktPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(height: 20),
        ButtonTextBoxWidget(
          title: "DEC112 Gehörlosennotruf",
          content: [
            "DEC112 bietet für gehörlose und hörbehinderte Personen eine Möglichkeit Notrufdienste mittels Textnachrichten zu kontaktieren."
          ],
          buttonName: "Klicke hier für mehr",
          action: null,
        ),
        Divider(),
        ButtonTextBoxWidget(
          title: "Gehörlosen Service 0800 133 133",
          content: [
            "Unter 0800/133133 können Sie per SMS die Polizei kontaktieren."
          ],
          buttonName: "Jetzt schreiben",
          action: null,
        ),
        Divider(),
        ButtonTextBoxWidget(
          title: "Feuerwehr 122",
          content: [],
          buttonName: " Jetzt anrufen",
          action: null,
        ),
        Divider(),
        ButtonTextBoxWidget(
          title: "Team Barrierefrei Universität Wien",
          content: [
            "Unter barrierefrei@univie.ac.at können Sie das Team Barrierefrei  der Universität Wien kontaktieren."
          ],
          buttonName: "Jetzt schreiben",
          action: null,
        ),
      ],
    );
  }
}
