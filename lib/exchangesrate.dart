import 'package:http/http.dart';

class rates{


    Future Bitcoin(String currency_dropdown)async{
    Uri uri =  Uri.parse('https://rest.coinapi.io/v1/exchangerate/BTC/$currency_dropdown?apikey=4651F2C2-7F16-4311-ACDA-9F0915F7923E');
    Response response = await get(uri);
   // print(response.body);
    return response.body;
  }


    Future Etherium(String currency_dropdown)async{
      Uri uri =  Uri.parse('https://rest.coinapi.io/v1/exchangerate/ETH/$currency_dropdown?apikey=4651F2C2-7F16-4311-ACDA-9F0915F7923E');
      Response response = await get(uri);
      // print(response.body);
      return response.body;
    }


    Future Litecoin(String currency_dropdown)async{
      Uri uri =  Uri.parse('https://rest.coinapi.io/v1/exchangerate/LTC/$currency_dropdown?apikey=4651F2C2-7F16-4311-ACDA-9F0915F7923E');
      Response response = await get(uri);
      // print(response.body);
      return response.body;
    }


    Future UdsTether(String currency_dropdown)async{
      Uri uri =  Uri.parse('https://rest.coinapi.io/v1/exchangerate/USDT/$currency_dropdown?apikey=4651F2C2-7F16-4311-ACDA-9F0915F7923E');
      Response response = await get(uri);
      // print(response.body);
      return response.body;
    }


}