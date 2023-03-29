import 'dart:convert';

import 'package:flutter/foundation.dart';

class CryptoModel {
  static List<Crypto_List>? cryptos;
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Crypto_List {
  final String uuid;
  final String symbol;
  final String name;
  final String iconUrl;
  final String marketCap;
  final String price;
  final String btcPrice;
  final String change;
  final num rank;
  final List<dynamic> sparkline;
  final String coinrankingUrl;

  Crypto_List({
    required this.uuid,
    required this.symbol,
    required this.name,
    required this.iconUrl,
    required this.marketCap,
    required this.price,
    required this.btcPrice,
    required this.change,
    required this.rank,
    required this.sparkline,
    required this.coinrankingUrl,
  });

  Crypto_List copyWith({
    String? uuid,
    String? symbol,
    String? name,
    String? iconUrl,
    String? marketCap,
    String? price,
    String? btcPrice,
    String? change,
    num? rank,
    List<dynamic>? sparkline,
    String? coinrankingUrl,
  }) {
    return Crypto_List(
      uuid: uuid ?? this.uuid,
      symbol: symbol ?? this.symbol,
      name: name ?? this.name,
      iconUrl: iconUrl ?? this.iconUrl,
      marketCap: marketCap ?? this.marketCap,
      price: price ?? this.price,
      btcPrice: btcPrice ?? this.btcPrice,
      change: change ?? this.change,
      rank: rank ?? this.rank,
      sparkline: sparkline ?? this.sparkline,
      coinrankingUrl: coinrankingUrl ?? this.coinrankingUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'symbol': symbol,
      'name': name,
      'iconUrl': iconUrl,
      'marketCap': marketCap,
      'price': price,
      'btcPrice': btcPrice,
      'change': change,
      'rank': rank,
      'sparkline': sparkline,
      'coinrankingUrl': coinrankingUrl,
    };
  }

  factory Crypto_List.fromMap(Map<String, dynamic> map) {
    return Crypto_List(
      uuid: map['uuid'] as String,
      symbol: map['symbol'] as String,
      name: map['name'] as String,
      iconUrl: map['iconUrl'] as String,
      marketCap: map['marketCap'] as String,
      price: map['price'] as String,
      btcPrice: map['btcPrice'] as String,
      change: map['change'] as String,
      rank: map['rank'] as num,
      sparkline: List<dynamic>.from((map['sparkline'] as List<dynamic>)),
      coinrankingUrl: map['coinrankingUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Crypto_List.fromJson(String source) =>
      Crypto_List.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Crypto_List(uuid: $uuid, symbol: $symbol, name: $name, iconUrl: $iconUrl, marketCap: $marketCap, price: $price, btcPrice: $btcPrice, change: $change, rank: $rank, sparkline: $sparkline, coinrankingUrl: $coinrankingUrl)';
  }

  @override
  bool operator ==(covariant Crypto_List other) {
    if (identical(this, other)) return true;

    return other.uuid == uuid &&
        other.symbol == symbol &&
        other.name == name &&
        other.iconUrl == iconUrl &&
        other.marketCap == marketCap &&
        other.price == price &&
        other.btcPrice == btcPrice &&
        other.change == change &&
        other.rank == rank &&
        listEquals(other.sparkline, sparkline) &&
        other.coinrankingUrl == coinrankingUrl;
  }

  @override
  int get hashCode {
    return uuid.hashCode ^
        symbol.hashCode ^
        name.hashCode ^
        iconUrl.hashCode ^
        marketCap.hashCode ^
        price.hashCode ^
        btcPrice.hashCode ^
        change.hashCode ^
        rank.hashCode ^
        sparkline.hashCode ^
        coinrankingUrl.hashCode;
  }
}
