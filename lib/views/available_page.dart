import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tarim_app/views/bank_page.dart';
import 'package:tarim_app/views/chicken_page.dart';
import 'package:tarim_app/views/cow_page.dart';
import 'package:tarim_app/views/manure_page.dart';
import 'package:tarim_app/views/sheep_page.dart';

class AvailablePage extends StatefulWidget {
  const AvailablePage({Key? key}) : super(key: key);

  @override
  State<AvailablePage> createState() => _AvailablePageState();
}

class _AvailablePageState extends State<AvailablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Mevcut"),
        ),
      ),
      body: CustomScrollView(
        primary: false,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverGrid.count(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              children: <Widget>[
                Column(
                  children: [
                    InkWell(
                      child: Expanded(
                          child : Lottie.network(
                            "https://assets6.lottiefiles.com/packages/lf20_6wA0Oc.json",
                            repeat: true,
                            reverse: true,
                            animate: true,
                          )
                      ),
                      //büyükbaş
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder:(context) => CowListPage())
                        );
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Expanded(
                          child : Lottie.network(
                            "https://assets10.lottiefiles.com/private_files/lf30_v6ouis2s.json",
                            repeat: true,
                            reverse: true,
                            animate: true,
                          )
                      ),//küçükbaş
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder:(context) => SheepListPage())
                        );
                      },
                    ),
                  ],
                ),
                Column(
                  children: [
                    InkWell(
                      child: Expanded(
                          child : Lottie.network(
                            "https://assets6.lottiefiles.com/packages/lf20_kp0ixjwm.json",
                            repeat: true,
                            reverse: true,
                            animate: true,
                          )
                      ),//tavuk
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder:(context) => ChickenListPage())
                        );
                      },
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Expanded(
                          child : Lottie.network(
                            "https://assets9.lottiefiles.com/packages/lf20_8yi8xwt1.json",
                            repeat: true,
                            reverse: true,
                            animate: true,
                          )
                      ),//gübre
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder:(context) => ManureListPage())
                        );
                      },
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Expanded(
                          child : Lottie.network(
                            "https://assets4.lottiefiles.com/packages/lf20_8bQrh5.json",
                            repeat: true,
                            reverse: true,
                            animate: true,
                          )
                      ),//banka
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder:(context) => BankListPage())
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
