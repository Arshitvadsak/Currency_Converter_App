import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Image.network(
                  'https://img.freepik.com/free-photo/coins-paper-money-globe-white-statistic-form-background_1387-396.jpg?w=2000',
                  fit: BoxFit.cover,
                ),
                Divider(thickness: 2),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 100,
                ),
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 20,
                        ),
                        Icon(
                          Icons.currency_exchange_rounded,
                          color: Colors.black38,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 20,
                        ),
                        Text(
                          "Convert Currencies",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 20,
                        ),
                        Icon(
                          Icons.featured_play_list_outlined,
                          color: Colors.black38,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 20,
                        ),
                        Text(
                          "Exchange Rate List",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 20,
                        ),
                        Icon(
                          Icons.star_border,
                          color: Colors.black38,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 20,
                        ),
                        Text(
                          "Rate And Review",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 55,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 20,
                        ),
                        Icon(
                          Icons.email_outlined,
                          color: Colors.black38,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 20,
                        ),
                        Text(
                          "Contact Developer",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
