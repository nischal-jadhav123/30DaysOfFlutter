// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CryptoDetailDto {
  static CryptoDetailModel? values;
}

class CryptoDetailModel {
  final String uuid;
  final String symbol;
  final String name;
  final String price;
  final List<dynamic> sparkline;

  CryptoDetailModel(
    this.uuid,
    this.symbol,
    this.name,
    this.price,
    this.sparkline,
  );

  CryptoDetailModel copyWith({
    String? uuid,
    String? symbol,
    String? name,
    String? price,
    List<dynamic>? sparkline,
  }) {
    return CryptoDetailModel(
      uuid ?? this.uuid,
      symbol ?? this.symbol,
      name ?? this.name,
      price ?? this.price,
      sparkline ?? this.sparkline,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'symbol': symbol,
      'name': name,
      'price': price,
      'sparkline': sparkline,
    };
  }

  factory CryptoDetailModel.fromMap(Map<String, dynamic> map) {
    return CryptoDetailModel(
      map['uuid'] as String,
      map['symbol'] as String,
      map['name'] as String,
      map['price'] as String,
      List<dynamic>.from((map['sparkline'] as List<dynamic>)),
    );
  }

  String toJson() => json.encode(toMap());

  factory CryptoDetailModel.fromJson(String source) =>
      CryptoDetailModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CryptoDetailModel(uuid: $uuid, symbol: $symbol, name: $name, price: $price, sparkline: $sparkline)';
  }

  @override
  bool operator ==(covariant CryptoDetailModel other) {
    if (identical(this, other)) return true;

    return other.uuid == uuid &&
        other.symbol == symbol &&
        other.name == name &&
        other.price == price &&
        listEquals(other.sparkline, sparkline);
  }

  @override
  int get hashCode {
    return uuid.hashCode ^
        symbol.hashCode ^
        name.hashCode ^
        price.hashCode ^
        sparkline.hashCode;
  }
}
