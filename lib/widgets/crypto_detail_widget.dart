import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/crypto_details.dart';
import 'package:chart_sparkline/chart_sparkline.dart';

import '../utils/convert.dart';

class CryptoDetailBodyWidget extends StatelessWidget {
  final CryptoDetailModel? data;

  // ignore: unnecessary_null_comparison
  const CryptoDetailBodyWidget({
    key,
    required this.data,
    // ignore: unnecessary_null_comparison
  })  : assert(data != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Text("${data?.name}"),
              const Spacer(),
              Text("\$${Convert.trimPrice(data!.price)}")
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Sparkline(
            data: Convert.convertStringToDouble(data!.sparkline),
            lineWidth: 4.0,
            lineColor: Colors.greenAccent,
          ),
        ],
      ),
    );
  }
}
