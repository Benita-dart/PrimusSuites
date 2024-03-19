class TransactionHistoryModal {
  String? message;
  TransactionData? data;
  bool? success;

  TransactionHistoryModal({this.message, this.data, this.success});

  TransactionHistoryModal.fromJson(Map<String, dynamic> json) {
    message = json["message"];
    data = json["data"] == null ? null : TransactionData.fromJson(json["data"]);
    success = json["success"];
  }

  static List<TransactionHistoryModal> fromList(
      List<Map<String, dynamic>> list) {
    return list.map((map) => TransactionHistoryModal.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["message"] = message;
    data["data"] = data;
    data["success"] = success;
    return data;
  }
}

class TransactionData {
  bool? isSuccessful;
  List<Message>? message;
  dynamic customerIdInString;
  dynamic transactionTrackingRef;
  dynamic page;

  TransactionData(
      {this.isSuccessful,
      this.message,
      this.customerIdInString,
      this.transactionTrackingRef,
      this.page});

  TransactionData.fromJson(Map<String, dynamic> json) {
    isSuccessful = json["is_successful"];
    message = json["message"] == null
        ? null
        : (json["message"] as List).map((e) => Message.fromJson(e)).toList();
    customerIdInString = json["customer_id_in_string"];
    transactionTrackingRef = json["transaction_tracking_ref"];
    page = json["page"];
  }

  static List<TransactionData> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => TransactionData.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["is_successful"] = isSuccessful;
    if (message != null) {
      data["message"] = message?.map((e) => e.toJson()).toList();
    }
    data["customer_id_in_string"] = customerIdInString;
    data["transaction_tracking_ref"] = transactionTrackingRef;
    data["page"] = page;
    return data;
  }
}

class Message {
  int? id;
  String? currentDate;
  bool? isReversed;
  dynamic reversalReferenceNo;
  int? withdrawableAmount;
  String? uniqueIdentifier;
  String? instrumentNo;
  String? transactionDate;
  String? transactionDateString;
  String? referenceId;
  String? narration;
  int? amount;
  int? openingBalance;
  int? balance;
  String? postingType;
  String? debit;
  String? credit;
  bool? isCardTransaction;
  dynamic accountNumber;
  String? serviceCode;
  String? recordType;
  dynamic productInfo;

  Message(
      {this.id,
      this.currentDate,
      this.isReversed,
      this.reversalReferenceNo,
      this.withdrawableAmount,
      this.uniqueIdentifier,
      this.instrumentNo,
      this.transactionDate,
      this.transactionDateString,
      this.referenceId,
      this.narration,
      this.amount,
      this.openingBalance,
      this.balance,
      this.postingType,
      this.debit,
      this.credit,
      this.isCardTransaction,
      this.accountNumber,
      this.serviceCode,
      this.recordType,
      this.productInfo});

  Message.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    currentDate = json["current_date"];
    isReversed = json["is_reversed"];
    reversalReferenceNo = json["reversal_reference_no"];
    withdrawableAmount = json["withdrawable_amount"];
    uniqueIdentifier = json["unique_identifier"];
    instrumentNo = json["instrument_no"];
    transactionDate = json["transaction_date"];
    transactionDateString = json["transaction_date_string"];
    referenceId = json["reference_id"];
    narration = json["narration"];
    amount = json["amount"];
    openingBalance = json["opening_balance"];
    balance = json["balance"];
    postingType = json["posting_type"];
    debit = json["debit"];
    credit = json["credit"];
    isCardTransaction = json["is_card_transaction"];
    accountNumber = json["account_number"];
    serviceCode = json["service_code"];
    recordType = json["record_type"];
    productInfo = json["product_info"];
  }

  static List<Message> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Message.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["current_date"] = currentDate;
    data["is_reversed"] = isReversed;
    data["reversal_reference_no"] = reversalReferenceNo;
    data["withdrawable_amount"] = withdrawableAmount;
    data["unique_identifier"] = uniqueIdentifier;
    data["instrument_no"] = instrumentNo;
    data["transaction_date"] = transactionDate;
    data["transaction_date_string"] = transactionDateString;
    data["reference_id"] = referenceId;
    data["narration"] = narration;
    data["amount"] = amount;
    data["opening_balance"] = openingBalance;
    data["balance"] = balance;
    data["posting_type"] = postingType;
    data["debit"] = debit;
    data["credit"] = credit;
    data["is_card_transaction"] = isCardTransaction;
    data["account_number"] = accountNumber;
    data["service_code"] = serviceCode;
    data["record_type"] = recordType;
    data["product_info"] = productInfo;
    return data;
  }
}
