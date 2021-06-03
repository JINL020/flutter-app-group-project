import 'package:flutter/material.dart';
import 'package:hci_m3_app/info_page/buttonTextbox.dart';

class VerhaltenPage extends StatelessWidget {
  const VerhaltenPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(height: 20),
        ButtonTextBoxWidget(
          title: "Im Falle eines Alarms",
          content: [
            "Bitte verlassen Sie das Gebäude ruhig und in einem zügigen Tempo. Nutzen Sie dazu den nähersten (Not)ausgang.",
            "Es besteht kein Grund zur Panik!"
          ],
          buttonName: null,
          action: null,
        ),
        Divider(),
        ButtonTextBoxWidget(
          title: "Verhalten bei Brandausbruch",
          content: [
            "Ruhe bewahren und immer beachten:\n",
            "1. Alarmieren der Feuerwehr\n",
            "2. erforderlichenfalls Räumungsalarm auslösen\n",
            "3. Türen des Brandraumes schließen.\n",
            "4. Stiegenhaus- und Fluchtwegtüren schließen, Stiegenhausfenster öffnen.\n",
            "5. Lüftungs- und Klimaanlagen abstellen\n",
            "6. Aufzüge nicht benutzen.\n",
            "7. Bei Ertönen des Räumungsalarmes, sofort das Gebäude verlassen.\nFalls dies nicht möglich ist:",
            "   - im Raum verbleiben\n  -  Türen schließen & Fenster öffnen\n   - sich den Löschkräften bemerkbar machen"
          ],
          buttonName: null,
          action: null,
        ),
        Divider(),
        ButtonTextBoxWidget(
          title: "Verhalten während des Brandes",
          content: [
            "1. Der Feuerwehr die Zufahrt öffnen\n",
            "2. Rettungsversuche nur nach Anweisung der Einsatzkräfte durchführen\n",
            "3. Bei der Brandbekämpfung ist folgendes zu beachten:\n",
            "- Löschstrahl nicht in Rauch und Flammen, sondern direkt auf die brennenden Gegenstände richten,\n",
            "- Leicht brennbare Gegenstände aus der Nähe des Brandes entfernen oder durch kühlen mit Wasser vor Entzündung schützen\n",
            "- Bei Flugfeuer oder Funkenflug sämtliche Öffnungen, insbesondere Türen und Fenster der gefährdeten Objekte schließen\n",
            "- Für die Tätigkeit der Einsatzkräfte Platz machen und deren Anordnungen Folge leisten"
          ],
          buttonName: null,
          action: null,
        ),
        Divider(),
        ButtonTextBoxWidget(
          title: "Brandschutzordnung der Uni Wien",
          content: [],
          buttonName: "Kicke hier",
          action: null,
        ),
      ],
    );
    ;
  }
}
