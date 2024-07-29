import 'package:flutter/material.dart';

import '../components/container1.dart';
import 'read_nfc_screen.dart';

class ReadandWriteNfc extends StatelessWidget {
  const ReadandWriteNfc({super.key});

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
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyContainer1(
                  text: 'View Menu',
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (contect) => const ReadNfcScreen()));
                  },
                ),
                const SizedBox(height: 20),
                MyContainer1(
                  text: 'Add Menu',
                  onTap: () {},
                )
              ],
            ),
          )),
    );
  }
}
