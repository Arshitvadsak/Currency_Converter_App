import 'dart:convert';
import 'package:http/http.dart' as http;
import '../modals/currency.dart';

class APIHelper {
  APIHelper._();

  static final APIHelper apiHelper = APIHelper._();

  Future<List<Currency>?> fetchWeatherData() async {
    String apiKey = "7pcl8Jvox8cdPmIjiOYwZmXUfKTQQLwrrwmRg1oh";
    String api = "https://api.currencyapi.com/v3/latest?apikey=$apiKey";
    

    http.Response res = await http.get(Uri.parse(api));

    if (res.statusCode == 200) {
      Map decodedData = jsonDecode(res.body);
      List<Currency> list = [];
      print("ok");
      (decodedData['data'] as Map).forEach((key, value) {
        Currency currency = Currency.fromMap(data: value);
        list.add(currency);
      });

      return list;
    }
    return null;
  }
}
