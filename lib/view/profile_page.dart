import 'package:chuva_dart/geral.dart';
import 'package:chuva_dart/view/description_page.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

import '../models/data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage(this.data,{super.key});
  final Data data;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  MyTheme theme = MyTheme();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 500,
            height: 100,
            color: theme.blue[400],
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: theme.white,
                        ),
                        onPressed: () {},
                      ),
                      const SizedBox(
                        width: 64,
                      ),
                      Text(
                        'Chuva ❤ Flutter',
                        style: TextStyle(
                          fontSize: 16,
                          color: theme.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.people),
                    SizedBox(
                      width: 16,
                    ),
                    Column(
                      children: [
                        Text(widget.data.description?.ptBr ?? ''),
                        Text('Universidade de Cambridge'),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                Text('Bio'),
                Text('Lorem ipsum dolor sit amet, consectetur adipisci elit, sed eiusmod tempor incidunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur. Quis aute iure reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint obcaecat cupiditat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                SizedBox(height: 16,),
                Text("dom., 26/11/2023"),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
