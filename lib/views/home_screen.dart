import 'package:flutter/material.dart';
import 'package:wallet_app/adapters/wallet_adapter.dart';
import 'package:wallet_app/models/wallet.dart';
import 'package:wallet_app/utils/hex_color.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:wallet_app/views/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  Wallet selected_wallet;
  List<Wallet> wallet_list = [];

  @override
  Widget build(BuildContext context) {
    String num = "";
    if(selected_wallet.id < 10) {
      num = "0${selected_wallet.id}";
    }
    else {
      num = "${selected_wallet.id}";
    }

    return Scaffold(
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        closeButtonStyle: ExpandableFabCloseButtonStyle(
          child: const Icon(Icons.close),
          backgroundColor: HexColor("#9F7EE9"),
        ),
        backgroundColor: HexColor("#9F7EE9"),
        children: [
          FloatingActionButton(
            heroTag: "add_wallet",
            backgroundColor: HexColor("#FFFFFF"),
            child: Image.asset("assets/images/wallet_add.png"),
            onPressed: () {},
          ),
          FloatingActionButton(
            heroTag: "import_wallet",
            backgroundColor: HexColor("#FFFFFF"),
            child: Image.asset("assets/images/import.png"),
            onPressed: () {},
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: HexColor("#14131B"),
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsScreen()));
            },
            child: Image.asset("assets/images/setting.png"),
          )
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: HexColor("#14131B"),
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                padding: const EdgeInsets.all(15),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  image: DecorationImage(
                    image: AssetImage("assets/images/bg_wallet.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Account $num",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'sono-medium',
                        ),),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                useSafeArea: false,
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  backgroundColor: Colors.transparent,
                                  contentPadding: const EdgeInsets.all(0),
                                  content: Container(
                                    alignment: Alignment.center,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: HexColor("#3B3A41"),
                                      borderRadius: const BorderRadius.all(Radius.circular(16))
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                                          child: Row(
                                            children: [
                                              Image.asset("assets/images/secret_phrase.png"),
                                              Container(width: 15,),
                                              const Text("Secret phrase", style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                                fontFamily: 'sono-regular'
                                              ),),
                                              Container(width: 80,),
                                              const Icon(Icons.chevron_right, size: 20, color: Colors.white,),
                                            ],
                                          ),
                                        ),
                                        const Divider(color: Colors.white,),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                                          child: Row(
                                            children: [
                                              Image.asset("assets/images/disconnect_wallet.png"),
                                              Container(width: 15,),
                                              const Text("Disconnect wallet", style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontFamily: 'sono-regular'
                                              ),),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ),
                              );
                            },
                            child: Image.asset("assets/images/setting_wallet.png"),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(selected_wallet.address,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'sono-regular',
                          ),),
                        Container(width: 10,),
                        GestureDetector(
                          onTap: () {

                          },
                          child: Image.asset("assets/images/copy.png"),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(height: 15,),
              const Text("My wallets",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'sono-bold',
              ),),
              Container(height: 15,),
              ListView.separated(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemCount: wallet_list.length,
                itemBuilder: (context, index) {
                  return WalletAdapter(wallet: wallet_list[index], callback: (Wallet wallet) {
                    setState(() {
                      selected_wallet = wallet;
                    });
                  },);
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    wallet_list.add(Wallet(address: "0X065dE7e2d6h81", seed: "hello world", id: 1));
    wallet_list.add(Wallet(address: "0X065dE7e2d6h82", seed: "hello world", id: 2));
    wallet_list.add(Wallet(address: "0X065dE7e2d6h83", seed: "hello world", id: 3));
    wallet_list.add(Wallet(address: "0X065dE7e2d6h84", seed: "hello world", id: 4));
    wallet_list.add(Wallet(address: "0X065dE7e2d6h85", seed: "hello world", id: 5));

    selected_wallet = wallet_list[0];
    super.initState();
  }

}
