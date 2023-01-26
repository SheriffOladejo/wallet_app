import 'package:flutter/material.dart';
import 'package:wallet_app/models/wallet.dart';
import 'package:wallet_app/utils/hex_color.dart';

class WalletAdapter extends StatefulWidget {

  Wallet wallet;
  Function callback;
  WalletAdapter({this.wallet, this.callback});

  @override
  State<WalletAdapter> createState() => _WalletAdapterState();

}

class _WalletAdapterState extends State<WalletAdapter> {
  @override
  Widget build(BuildContext context) {
    String num = "";
    if(widget.wallet.id < 10) {
      num = "0${widget.wallet.id}";
    }
    else {
      num = "${widget.wallet.id}";
    }
    return GestureDetector(
      onTap: () {
        widget.callback(widget.wallet);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: HexColor("#3B3A41"),
        height: 70,
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Image.asset("assets/images/wallet_icon.png"),
            Container(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Account $num",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'sono-medium',
                  ),),
                Container(height: 5,),
                Text(widget.wallet.address,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'sono-regular',
                  ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}
