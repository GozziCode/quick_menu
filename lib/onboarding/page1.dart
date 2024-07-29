import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_menu/components/container1.dart';

class EnableNfcScreen extends StatelessWidget {
  const EnableNfcScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/Enable_NFC.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 98.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 327.72,
                      width: 327.72,
                      child: Image.asset('assets/nfc_frame.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 199.14),
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: 78,
                        width: 381,
                        child: Center(
                          child: Text(
                            'Please enable NFC on your device to continue',
                            style: GoogleFonts.inter(
                              fontSize: 32,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(72, 70, 70, 1),
                              height: 38.73 / 32,
                            ),
                          ),
                        ),
                      ),
                    ),
                    MyContainer1(
                        text: 'Open Settings',
                        onTap: () {
                          AppSettings.openAppSettingsPanel(
                              AppSettingsPanelType.nfc);
                        })
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

