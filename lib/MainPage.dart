import 'package:flutter/cupertino.dart';
import 'package:crypto_ticker/currency.dart';
import 'package:flutter/material.dart';
import 'exchangesrate.dart';
import 'dart:convert';


class MainPaage extends StatefulWidget {
  const MainPaage({Key? key}) : super(key: key);

  @override
  State<MainPaage> createState() => _MainPaageState();
}

class _MainPaageState extends State<MainPaage> {

  double btcRate = 0;
  double ethRate = 0 ;
  double ltcRate = 0 ;
  double usdtRate = 0 ;
  String currency_dropdown = 'USD';




  List<DropdownMenuItem<String>> getDropdownMenuItem(){

    List<DropdownMenuItem<String>>  item = [];

    for(int i = 0 ; i< currenciesList.length ; i++){
       var x = DropdownMenuItem(child: Text(currenciesList[i]), value: currenciesList[i]) ;

       item.add(x);
    }
    return  item;
  }


  rates rate = rates();


  Future  currencyexchangerateBTC(String currency) async{
   var btc =   await rate.Bitcoin(currency_dropdown);
   setState(() {
     btcRate =  jsonDecode(btc)['rate'];
     print(btcRate);
   });
   return  btcRate;
  }

  Future  currencyexchangerateETH(String currency) async{
    var btc =   await rate.Etherium(currency_dropdown);
    setState(() {
      ethRate =  jsonDecode(btc)['rate'];
      print(ethRate);
    });
    return  ethRate;
  }

  Future  currencyexchangerateLTC(String currency) async{
    var btc =   await rate.Litecoin(currency_dropdown);
    setState(() {
      ltcRate =  jsonDecode(btc)['rate'];
      print(ltcRate);
    });
    return  ltcRate;
  }
  Future  currencyexchangerateUSDT(String currency) async{
    var btc =   await rate.UdsTether(currency_dropdown);
    setState(() {
      usdtRate =  jsonDecode(btc)['rate'];
      print(usdtRate);
    });
    return  usdtRate;
  }








  @override

  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Crypto - Ticker')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(130, 25, 80, 20),
              width: 400,
              height: 80,
              color: Colors.purpleAccent.shade100,
              child: Text('1 BTC = $currency_dropdown $btcRate'),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(130, 25, 80, 20),
              width: 400,
              height: 80,
              color: Colors.purpleAccent.shade100,
              child: Text('1 ETH = $currency_dropdown $ethRate'),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(130, 25, 80, 20),
              width: 400,
              height: 80,
              color: Colors.purpleAccent.shade100,
              child: Text('1 LTC = $currency_dropdown $ltcRate'),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(130, 25, 80, 20),
              width: 400,
              height: 80,
              color: Colors.purpleAccent.shade100,
              child: Text('1 USDT = $currency_dropdown $usdtRate'),
            ),
            Container(
              color: Colors.blueAccent,
              height: 80,
              width: double.infinity,
            child: DropdownButton(
              value: currency_dropdown,
              items: getDropdownMenuItem(),
             onChanged: (value) {
                setState(()  {
                  currency_dropdown = value.toString();
                  currencyexchangerateBTC(value.toString());
                  currencyexchangerateETH(value.toString());
                  currencyexchangerateLTC(value.toString());
                  currencyexchangerateUSDT(value.toString());


                });

             },

            ),
            )

          ],
        ),
      )
    );
  }
}
// DropdownButton<String>(
// value: currency_dropdown,
// items : getDropdownMenuItem(),
//
//
// // DropdownMenuItem(
// //   child: Text('USD'),
// //   value: 'USD',
// // ),
// // DropdownMenuItem(
// //   child: Text('PKR'),
// //   value: 'PKR',
// // ),
// // DropdownMenuItem(
// //   child: Text('CND'),
// //   value: 'CND',
// // )
//
// onChanged: (value){
// setState(() {
//
// currency_dropdown = value.toString();
// print(currency_dropdown);
// });
//
// },
// )