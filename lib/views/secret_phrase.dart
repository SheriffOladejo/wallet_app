import 'package:flutter/material.dart';
import 'package:wallet_app/utils/hex_color.dart';
import 'package:wallet_app/utils/methods.dart';

class SecretPhrase extends StatefulWidget {
  const SecretPhrase({Key key}) : super(key: key);

  @override
  State<SecretPhrase> createState() => _SecretPhraseState();

}

class _SecretPhraseState extends State<SecretPhrase> {

  bool is_password_visible = false;
  bool is_password_focus = false;

  TextEditingController phrase_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();
  TextEditingController address_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: HexColor("#14131B"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: HexColor("#14131B"),
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Secret phrase", style: TextStyle(
              color: Colors.white,
              fontFamily: 'sono-bold',
              fontSize: 24,
            ),),
            Container(height: 8,),
            const Text("You will be prompted to enter your address and password "
                "to recover your wallet", style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'sono-regular',
            ),),
            Container(height: 15,),
            const Text("Seed phrase",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'sono-regular',
              ),),
            Container(height: 8,),
            TextFormField(
              validator: (val){
                if(val != null){
                  if(val.toString().isEmpty) {
                    return "Required";
                  }
                  return null;
                }
                return null;
              },
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'sono-regular'
              ),
              controller: phrase_controller,
              minLines: 5,
              maxLines: 7,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                  focusedBorder: focusedBorder(),
                  enabledBorder: enabledBorder(),
                  errorBorder: errorBorder(),
                  disabledBorder: disabledBorder()
              ),
            ),
            Container(
              height: 8,
            ),
            const Text("Wallet address",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'sono-regular',
              ),),
            Container(height: 8,),
            TextFormField(
              validator: (val){
                if(val != null){
                  if(val.toString().isEmpty) {
                    return "Required";
                  }
                  return null;
                }
                return null;
              },
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'sono-regular'
              ),
              controller: address_controller,
              minLines: 2,
              maxLines: 4,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                  focusedBorder: focusedBorder(),
                  enabledBorder: enabledBorder(),
                  errorBorder: errorBorder(),
                  disabledBorder: disabledBorder()
              ),
            ),
            Container(
              height: 8,
            ),
            const Text("Password",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'sono-regular',
              ),),
            Container(height: 8,),
            FocusScope(
              child: Focus(
                onFocusChange: (focus) {
                  setState(() {
                    is_password_focus = !is_password_focus;
                  });
                },
                child: TextFormField(
                  validator: (val){
                    if(val != null){
                      if(val.toString().isEmpty) {
                        return "Required";
                      }
                      return null;
                    }
                    return null;
                  },
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'sono-regular'
                  ),
                  controller: password_controller,
                  enableSuggestions: false,
                  autocorrect: false,
                  obscureText: !is_password_visible,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          is_password_visible ? Icons.visibility : Icons.visibility_off,
                          color: is_password_focus ? Theme.of(context).primaryColorDark : Colors.grey,
                        ),
                        onPressed: (){
                          setState(() {
                            is_password_visible = !is_password_visible;
                          });
                        },
                      ),
                      focusedBorder: focusedBorder(),
                      enabledBorder: enabledBorder(),
                      errorBorder: errorBorder()
                  ),
                ),
              ),
            ),
            Container(height: 10,),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: MaterialButton(
                onPressed: () async {

                },
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                color: HexColor("#ECE5FB"),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/copy.png", width: 20, height: 20, color: Colors.black,),
                    Container(width: 5,),
                    const Text(
                      "Copy secret phrase",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'sono-regular'
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
