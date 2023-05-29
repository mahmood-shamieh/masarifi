import 'dart:convert';

class PaymentModel {
  int? id;
  double? price;
  int? category_id;
  int? record_id;
  String? note;
  String? time_stamp;
  PaymentModel({
    this.id,
    this.price,
    this.category_id,
    this.record_id,
    this.note,
    this.time_stamp,
  });

  PaymentModel copyWith({
    int? id,
    double? price,
    int? category_id,
    int? record_id,
    String? note,
    String? time_stamp,
  }) {
    return PaymentModel(
      id: id ?? this.id,
      price: price ?? this.price,
      category_id: category_id ?? this.category_id,
      record_id: record_id ?? this.record_id,
      note: note ?? this.note,
      time_stamp: time_stamp ?? this.time_stamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'category_id': category_id,
      'record_id': record_id,
      'note': note,
      'time_stamp': time_stamp,
    };
  }

  factory PaymentModel.fromMap(Map<String, dynamic> map) {
    return PaymentModel(
      id: map['id'] != null ? map['id'] : null,
      price: map['price'] != null ? map['price'] : null,
      category_id: map['category_id'] != null ? map['category_id'] : null,
      record_id: map['record_id'] != null ? map['record_id'] : null,
      note: map['note'] != null ? map['note'] : null,
      time_stamp: map['time_stamp'] != null ? map['time_stamp'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentModel.fromJson(String source) =>
      PaymentModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PaymentModel(id: $id, price: $price, category_id: $category_id, record_id: $record_id, note: $note, time_stamp: $time_stamp)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PaymentModel &&
        other.id == id &&
        other.price == price &&
        other.category_id == category_id &&
        other.record_id == record_id &&
        other.note == note &&
        other.time_stamp == time_stamp;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        price.hashCode ^
        category_id.hashCode ^
        record_id.hashCode ^
        note.hashCode ^
        time_stamp.hashCode;
  }
}
