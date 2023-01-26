import 'package:flutter/material.dart';
import 'package:wallet_app/utils/hex_color.dart';
import 'package:wallet_app/utils/methods.dart';

class RestoreWalletScreen extends StatefulWidget {
  const RestoreWalletScreen({Key key}) : super(key: key);

  @override
  State<RestoreWalletScreen> createState() => _RestoreWalletState();

}

class _RestoreWalletState extends State<RestoreWalletScreen> {

  TextEditingController address_controller = TextEditingController();
  TextEditingController password_controller = TextEditingController();

  bool is_password_focus = false;
  bool is_password_visible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#14131B"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: HexColor("#14131B"),
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Logo",
              style: TextStyle(
                color: HexColor("#9F7EE9"),
                fontSize: 32,
                fontFamily: 'sono-bold',
              ),),
              Container(height: 5,),
              const Text("Enter your address and password to restore your wallet",
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'sono-regular',
                fontSize: 14,
              ),),
              Container(height: 15,),
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
              Container(height: 8,),
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
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'sono-regular'
                    ),
                    controller: password_controller,
                    obscureText: !is_password_visible,
                    enableSuggestions: false,
                    autocorrect: false,
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
              Container(
                height: 200,
              ),
              MaterialButton(
                onPressed: () async {

                },
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                color: HexColor("#9F7EE9"),
                height: 45,
                minWidth: 320,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32)),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'sono-regular'
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
