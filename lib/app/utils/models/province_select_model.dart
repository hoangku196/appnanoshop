import 'package:equatable/equatable.dart';

class ProvinceSelectModel extends Equatable {
  final String id, name;

  const ProvinceSelectModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toPaymentJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['payment_method'] = this.id;
    return data;
  }

  @override
  List<Object?> get props => [
        id,
      ];
}
