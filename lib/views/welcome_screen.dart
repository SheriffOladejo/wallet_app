import 'package:flutter/material.dart';
import 'package:wallet_app/utils/hex_color.dart';
import 'package:wallet_app/views/create_wallet_screen.dart';
import 'package:wallet_app/views/restore_wallet_screen.dart';


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#1E1E1E"),
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: HexColor("#1E1E1E"),
          image: const DecorationImage(
            image: AssetImage("assets/images/bg_welcome.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 230,
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Welcome!!", style: TextStyle(
                    fontFamily: 'sono-bold',
                    color: Colors.white,
                    fontSize: 32,
                  ),),
                  Container(height: 5,),
                  const Text("Import your wallets or create a new wallet address",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    fontFamily: 'sono-bold',
                    color: Colors.white,
                    fontSize: 14,
                  ),),
                ],
              ),
            ),
            const Spacer(),
            MaterialButton(
              onPressed: () async {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const RestoreWalletScreen()));
              },
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
              color: HexColor("#9F7EE9"),
              height: 45,
              minWidth: 320,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(32)),
              ),
              child: const Text(
                "Import a wallet",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'sono-regular'
                ),
              ),
            ),
            Container(height: 10,),
            Container(
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have one? ",
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'sono-regular',
                      color: Colors.white,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateWalletScreen()));
                    },
                    child: Text(
                      "Create a new wallet",
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'sono-regular',
                        color: HexColor("#9F7EE9"),
                      ),
                    ),
                  ),
                ],
              )
              )
          ],
        ),
      ),
    );
  }
}
