// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_catalog/models/crypto_list.dart';
import 'package:chart_sparkline/chart_sparkline.dart';

class CryptoListCoinWidget extends StatelessWidget {
  final Crypto_List list;

  // ignore: unnecessary_null_comparison
  const CryptoListCoinWidget({
    key,
    required this.list,
    // ignore: unnecessary_null_comparison
  })  : assert(list != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    String trimPrice(String price) {
      if (price == null) return "Not Found";
      var arr = price.split(".");
      if (arr.isEmpty) return "Not Found";
      if (arr.length > 1) {
        var temp = arr[1].substring(0, 3);
        return "${arr[0]}.$temp";
      }
      return arr[0];
    }

    List<double> convertStringToDouble(List<dynamic> values) {
      List<double> data = [];
      for (var val in values) {
        data.add(val != null ? double.parse(val) : 0.0);
      }
      return data;
    }

    return Card(
      child: ListTile(
        // leading: FittedBox(
        //     child: Sparkline(
        //   data: convertStringToDouble(list.sparkline),
        //   lineWidth: 5.0,
        //   lineColor: Colors.purple,
        // )),
        // // onTap: () {
        // //   print("${list.name} pressed");

        // // },
        // leading: const CircleAvatar(
        //   child: Icon(
        //     CupertinoIcons.mail,
        //     color: Colors.white,
        //   ),
        // ),
        leading: CircleAvatar(
          radius: 30,
          child: Image.network(
            list.iconUrl,
            loadingBuilder: (context, child, loadingProgress) =>
                (loadingProgress == null)
                    ? child
                    : const CircularProgressIndicator(),
            errorBuilder: (context, error, stackTrace) => const Icon(
              CupertinoIcons.mail,
              color: Colors.white,
            ),
          ),
        ),
        title: Text(list.name),
        subtitle: Text(
          "\$${trimPrice(list.price)}",
          textScaleFactor: 1.2,
          style:
              TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
        ),
        trailing: FittedBox(
            child: Sparkline(
          data: convertStringToDouble(list.sparkline),
          lineWidth: 5.0,
          lineColor: Colors.purple,
        )),
      ),
    );
  }
}
