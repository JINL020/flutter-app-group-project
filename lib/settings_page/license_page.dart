import 'package:flutter/material.dart';
import 'package:hci_m3_app/config/colors.dart';

class MyLicensePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LicensePage(
      applicationName: "Sicha",
      applicationIcon: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(2.5),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                AppColors.backgroundBlue.withOpacity(0.6),
                AppColors.backgroundRed.withOpacity(0.6),
              ]),
        ),
        child: Image.asset(
          "assets/images/logo_normal.png",
          width: 120,
          height: 120,
        ),
        clipBehavior: Clip.hardEdge,
      ),
      applicationVersion: "2.0.0",
      applicationLegalese: "Copyright ${DateTime.now().year}",
    );
  }
}
