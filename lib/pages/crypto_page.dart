import "dart:convert";
import "dart:io";

import "package:flutter/material.dart";
import "package:flutter_catalog/models/crypto_list.dart";
import "package:flutter_catalog/widgets/drawer.dart";
import 'package:http/http.dart' as http;

import "../widgets/crypto_widget.dart";

class CryptoApp extends StatefulWidget {
  const CryptoApp({super.key});

  @override
  State<CryptoApp> createState() => _CryptoAppState();
}

class _CryptoAppState extends State<CryptoApp> {
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    const String uri =
        "https://coinranking1.p.rapidapi.com/coins?referenceCurrencyUuid=yhjMzLPhuIDl&timePeriod=5y&tiers%5B0%5D=1&orderBy=marketCap&orderDirection=desc&limit=50";
    const Map<String, String> _headers = {
      "X-RapidAPI-Key": "d6fd486e6cmshad7dfb0b6fe2ba2p1a1182jsn52ccf720e943",
      "X-RapidAPI-Host": "coinranking1.p.rapidapi.com",
    };
    final response = await http.get(Uri.parse(uri), headers: _headers);
    final responseJson = jsonDecode(response.body);

    if (responseJson["status"] == "success") {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      final dataArr = responseJson["data"];
      final coins = dataArr["coins"];
      CryptoModel.cryptos = List.from(coins)
          .map<Crypto_List>((coin) => Crypto_List.fromMap(coin))
          .toList();
      setState(() {});
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load cryptoData');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Crypto Currency")),
      body: Container(
        child: (CryptoModel.cryptos != null)
            ? ListView.builder(
                itemCount: CryptoModel.cryptos?.length,
                itemBuilder: (context, index) {
                  return CryptoListCoinWidget(
                      list: CryptoModel.cryptos![index]);
                })
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: MyDrawer(),
    );
  }
}
