import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:tab_container/tab_container.dart';
import 'DrawerPage.dart';
import 'SettingPage.dart';
import 'infoPage.dart';
import 'ConverterPage.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  late final TabContainerController _controller;
  late TextTheme textTheme;

  @override
  void initState() {
    _controller = TabContainerController(length: 3);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    textTheme = Theme.of(context).textTheme;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency converter'),
        centerTitle: true,
      ),
      drawer:const Drawer(
        child: DrawerPage(),
      ),
      body: SizedBox(
        height: 900,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TabContainer(
                  color:(Get.isDarkMode)?Color(0xff957777) :const Color.fromARGB(255, 169, 202, 169),
                  tabEdge: TabEdge.right,
                  childPadding: const EdgeInsets.all(20.0),
                  children: _getChildren3(context),
                  tabs: _getTabs3(context),
                  isStringTabs: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getChildren3(BuildContext context) => <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  height: MediaQuery.of(context).size.height * .78,
                  child: const infoPage(),
                ),
              ],
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Curency converter",
              style: Theme.of(context).textTheme.headline5,
            ),
            const Divider(
              thickness: 2,
              color: Colors.black,
            ),
            Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              height: MediaQuery.of(context).size.height * .46,
              child: const CurrencyConverter(),
            ),
            Spacer(),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Profile', style: Theme.of(context).textTheme.headline5),
            const Divider(
              thickness: 2,
              color: Colors.black,
            ),
            const CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZmlsZXxlbnwwfHwwfHw%3D&w=1000&q=80'),
            ),
            Row(
              children: [
                
                Flexible(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text('username:',style: Theme.of(context).textTheme.titleSmall),
                      Text('email:',style: Theme.of(context).textTheme.titleSmall),
                      Text('birthday:',style: Theme.of(context).textTheme.titleSmall),
                    ],
                  ),
                ),
                const Spacer(),
                Flexible(
                  flex: 10,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Arshit Vadsak'),
                      Text('Arshit@gmail.com'),
                      Text('1/1/2002'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Settings', style: Theme.of(context).textTheme.headline5),
            const Divider(
              thickness: 2,
              color: Colors.black,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              height: MediaQuery.of(context).size.height * .72,
              child: const SettingsPage(),
            ),
            // SizedBox(height: 10,),
          ],
        ),
      ];

  List<Widget> _getTabs3(BuildContext context) => <Widget>[
        const Icon(
          Ionicons.information_circle,
        ),
        const Icon(
          Ionicons.document_text,
        ),
        const Icon(
          Ionicons.person,
        ),
        const Icon(
          Ionicons.settings,
        ),
      ];
}
