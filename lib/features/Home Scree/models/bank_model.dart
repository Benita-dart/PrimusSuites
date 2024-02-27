class Bank {
  final String name;
  final dynamic code; // Assuming the code could be either int or string

  Bank({
    required this.name,
    required this.code,
  });

  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      name: json['name'],
      code: json['code'],
    );
  }
}
