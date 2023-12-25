class SmsModel {
  String success;

  SmsModel({required this.success});

  factory SmsModel.fromJson(Map<String, dynamic> json) {
    return SmsModel(
      success: json['success'],
    );
  }
}
