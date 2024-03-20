class BalanceData {
  String? availableBalance;
  String? ledgerBalance;
  String? accountType;
  String? withdrawableBalance;

  BalanceData(
      {this.availableBalance,
      this.ledgerBalance,
      this.accountType,
      this.withdrawableBalance});

  BalanceData.fromJson(Map<String, dynamic> json) {
    availableBalance = json["available_balance"];
    ledgerBalance = json["ledger_balance"];
    accountType = json["account_type"];
    withdrawableBalance = json["withdrawable_balance"];
  }

  static List<BalanceData> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => BalanceData.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["available_balance"] = availableBalance;
    data["ledger_balance"] = ledgerBalance;
    data["account_type"] = accountType;
    data["withdrawable_balance"] = withdrawableBalance;
    return data;
  }
}
