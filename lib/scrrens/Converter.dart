import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../api_helper/api_helper.dart';
import '../modals/currency.dart';
import 'DrawerPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  late Future<List<Currency>?> getData;

  @override
  void initState() {
    super.initState();
    getData = APIHelper.apiHelper.fetchWeatherData();
  }

  var Style = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          height: 750,
          width: 360,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SizedBox(width: 20),
                  Expanded(
                    flex: 10,
                    child: TextField(
                      controller: searchController,
                      decoration: const InputDecoration(
                        hintText: "Search by country Name...",
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.black54),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        String searchedCity = searchController.text;
                        setState(() {
                          getData = APIHelper.apiHelper.fetchWeatherData();
                        });
                      },
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 7,
                child: FutureBuilder(
                  future: getData,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error : ${snapshot.error}"),
                      );
                    } else if (snapshot.hasData) {
                      List<Currency>? data = snapshot.data;

                      return (data != null)
                          ? ListView.builder(
                              itemCount: data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                    trailing: Text(
                                      "${data[index].value}",
                                      style: TextStyle(
                                          color: Colors.green, fontSize: 15),
                                    ),
                                    title: Text("${data[index].code}"));
                              })
                          : const Center(
                              child: Text("No data found..."),
                            );
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.red,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed('home');
            },
            child: Icon(Icons.mp_sharp),
          ),
          SizedBox(
            height: 20,
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushNamed('money');
            },
            child: Icon(Icons.tab),
          ),
        ],
      ),
    );
  }
}
