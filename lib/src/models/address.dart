// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'city.dart';
import 'phone.dart';

class Address {
  final String street;
  final int? number;
  final String zipCode;
  final City city;
  final Phone phone;

  Address({
    required this.street,
    this.number,
    required this.zipCode,
    required this.city,
    required this.phone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'street': street,
      'number': number,
      'zipCode': zipCode,
      'city': city.toMap(),
      'phone': phone.toMap(),
    };
  }

  factory Address.fromMap(Map<String, dynamic> map) {
    return Address(
      street: map['street'] as String,
      number: map['number'] != null ? map['number'] as int : null,
      zipCode: map['zipCode'] as String,
      city: City.fromMap(map['city'] as Map<String, dynamic>),
      phone: Phone.fromMap(map['phone'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Address.fromJson(String source) =>
      Address.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Rua $street, ${number ?? 'Sem número'} - $zipCode, $city - $phone)';
  }
}
