// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_catalog/models/crypto_list.dart';
import 'package:chart_sparkline/chart_sparkline.dart';

import '../utils/convert.dart';

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
        // leading: CircleAvatar(
        //   radius: 30,
        //   child: Image.network(
        //     list.iconUrl,
        //     loadingBuilder: (context, child, loadingProgress) =>
        //         (loadingProgress == null)
        //             ? child
        //             : const CircularProgressIndicator(),
        //     errorBuilder: (context, error, stackTrace) => const Icon(
        //       CupertinoIcons.mail,
        //       color: Colors.white,
        //     ),
        //   ),
        // ),
        title: Text(list.name),
        subtitle: Text(
          "\$${Convert.trimPrice(list.price)}",
          textScaleFactor: 1.2,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        trailing: FittedBox(
            child: Sparkline(
          data: Convert.convertStringToDouble(list.sparkline),
          lineWidth: 5.0,
          lineColor: Colors.greenAccent,
        )),
      ),
    );
  }
}
