
class Currency {
  final String code;
  final double value;

  Currency({
    required this.code,
    required this.value,
  });

  factory Currency.fromMap({required Map data}) {
    return Currency(
      code: data['code'],
      value: double.parse(data['value'].toString()),
    );
  }
}
