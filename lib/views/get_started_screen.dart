import 'package:flutter/material.dart';
import 'package:wallet_app/utils/hex_color.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:wallet_app/utils/methods.dart';
import 'package:wallet_app/views/welcome_screen.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({Key key}) : super(key: key);

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {

  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#14131B"),
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: HexColor("#14131B"),
        padding: const EdgeInsets.only(left: 15, right: 15,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/coins.png",),
            const Text("Easiest way to manage your assets",
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'sono-regular',
            ),),
            Container(height: 5,),
            const Text("Create and manage all your wallets in one place",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'sono-regular',
              ),),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              child: SwipeableButtonView(
                  buttonText: "       Slide to get started",
                  buttonColor: HexColor("#8469C2"),
                  buttontextstyle: const TextStyle(
                    color: Colors.black,
                    fontFamily: 'sono-regular',
                    fontSize: 12
                  ),
                  buttonWidget: Image.asset(
                    "assets/images/slide_icon.png",
                  ),
                  activeColor: HexColor("#9F7EE9"),
                  isFinished: isFinished,
                  onWaitingProcess: () {
                    Future.delayed(const Duration(seconds: 2), () {
                      setState(() {
                        isFinished = true;
                      });
                    });
                  },
                  onFinish: () async {
                    setState(() {
                      isFinished = false;
                    });
                    await Navigator.of(context).pushReplacement(slideLeft(const WelcomeScreen()));
                  }),
            ),
        ]
        )
      )
    );
  }
}
