import 'package:flutter/material.dart';
import 'package:wallet_app/utils/hex_color.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();

}

class _SettingsScreenState extends State<SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor("#14131B"),
        title: const Text("Settings", style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'sono-regular',
        ),),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: HexColor("#14131B"),
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Container(width: 10,),
                  Image.asset("assets/images/backup.png"),
                  Container(width: 10,),
                  const Text("Backup", style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'sono-regular',
                    fontSize: 14
                  ),),
                ],
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Container(width: 10,),
                  Image.asset("assets/images/connect_telegram.png"),
                  Container(width: 10,),
                  const Text("Connect telegram", style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'sono-regular',
                      fontSize: 14
                  ),),
                ],
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Container(width: 10,),
                  Image.asset("assets/images/privacy_policy.png"),
                  Container(width: 10,),
                  const Text("Privacy policy", style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'sono-regular',
                      fontSize: 14
                  ),),
                ],
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Container(width: 10,),
                  Image.asset("assets/images/terms_of_use.png"),
                  Container(width: 10,),
                  const Text("Terms of use", style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'sono-regular',
                      fontSize: 14
                  ),),
                ],
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

}
