import 'dart:convert';

class Coupon {
  final String name;
  final num value;

  Coupon({
    required this.name,
    required this.value,
  });

  Coupon copyWith({
    String? name,
    num? value,
  }) {
    return Coupon(
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'value': value,
    };
  }

  factory Coupon.fromMap(Map<String, dynamic> map) {
    return Coupon(
      name: map.keys.first,
      value: map.values.first as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coupon.fromJson(String source) =>
      Coupon.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Coupon(name: $name, value: $value)';
}
