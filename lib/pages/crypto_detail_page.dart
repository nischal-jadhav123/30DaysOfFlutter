import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/crypto_detail_widget.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:http/http.dart' as http;

import '../models/crypto_details.dart';

class CryptoDeatilsApp extends StatefulWidget {
  const CryptoDeatilsApp({super.key, required this.cryptoId});

  final String cryptoId;

  @override
  State<CryptoDeatilsApp> createState() => _CryptoDeatilsAppState();
}

class _CryptoDeatilsAppState extends State<CryptoDeatilsApp> {
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    const String uri =
        "https://coinranking1.p.rapidapi.com/coin/Qwsogvtv82FCd?referenceCurrencyUuid=yhjMzLPhuIDl&timePeriod=7d";
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
      final val = dataArr["coin"];
      CryptoDetailDto.values = CryptoDetailModel.fromMap(val);
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
      appBar: AppBar(
        title: const Text("CryptoDetails"),
      ),
      body: Container(
        child: CryptoDetailDto.values != null
            ? CryptoDetailBodyWidget(data: CryptoDetailDto.values)
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
