import 'dart:convert';

class Phone {
  final int ddd;
  final String number;

  Phone({
    required this.ddd,
    required this.number,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ddd': ddd,
      'number': number,
    };
  }

  factory Phone.fromMap(Map<String, dynamic> map) {
    return Phone(
      ddd: map['ddd'] as int,
      number: map['number'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Phone.fromJson(String source) =>
      Phone.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => '$ddd $number)';
}
