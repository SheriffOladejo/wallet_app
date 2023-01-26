import 'package:flutter/material.dart';
import 'package:wallet_app/utils/hex_color.dart';

class SplashScreen extends StatefulWidget {

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#1E1E1E"),
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        color: HexColor("#1E1E1E"),
        child: Center(
          child: Text("Logo", style: TextStyle(
            fontFamily: 'sono-bold',
            fontSize: 130,
            color: HexColor("#9F7EE9"),
          ),)
        ),
      ),
    );
  }

  Future init() async {
    Future.delayed(const Duration(seconds: 2), () async {
      // String passcode = await db.getPasscode();
      // if(passcode == null || passcode.isEmpty){
      //   Navigator.of(context).pushReplacement(slideLeft(const Intro()));
      // }
      // else{
      //   Navigator.of(context).pushReplacement(slideLeft(EnterPasscode()));
      // }

    });
  }

  @override
  void initState(){
    super.initState();
    init();
  }

}
