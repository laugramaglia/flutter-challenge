class IrCodeInfo {
  final String id;
  final String protocol;
  final String data;

  IrCodeInfo({
    required this.id,
    required this.protocol,
    required this.data,
  });

  factory IrCodeInfo.fromJson(Map<String, dynamic> json) {
    return IrCodeInfo(
      id: json['id'],
      protocol: json['protocol'],
      data: json['data'],
    );
  }
}
