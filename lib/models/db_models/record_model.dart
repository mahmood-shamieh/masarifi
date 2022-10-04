import 'dart:convert';

class RecordModel {
  int? id;
  String? date_as_id;
  RecordModel({
    this.id,
    this.date_as_id,
  });

  RecordModel copyWith({
    int? id,
    String? date_as_id,
  }) {
    return RecordModel(
      id: id ?? this.id,
      date_as_id: date_as_id ?? this.date_as_id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date_as_id': date_as_id,
    };
  }

  factory RecordModel.fromMap(Map<String, dynamic> map) {
    return RecordModel(
      id: map['id'] != null ? map['id'] : null,
      date_as_id: map['date_as_id'] != null ? map['date_as_id'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RecordModel.fromJson(String source) =>
      RecordModel.fromMap(json.decode(source));

  @override
  String toString() => date_as_id.toString();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RecordModel &&
        other.id == id &&
        other.date_as_id == date_as_id;
  }

  @override
  int get hashCode => id.hashCode ^ date_as_id.hashCode;
}
