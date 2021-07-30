import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Pod extends Equatable {
  final String? id;
  final String? code;
  final String? name;
  final DateTime? lastUpdate;

  const Pod({this.id, this.code, this.name, this.lastUpdate});

  @override
  List<Object?> get props => [id, code, name, lastUpdate];

  Pod copyWith({
    String? id,
    String? code,
    String? name,
    DateTime? lastUpdate,
  }) {
    return Pod(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      lastUpdate: lastUpdate ?? this.lastUpdate,
    );
  }

  factory Pod.fromMap(String id, Map<String, dynamic> data) {
    var pod = Pod(
      id: id,
      code: data['code'],
      name: data['name'],
    );

    if (data['last_update'] != null) {
      pod = pod.copyWith(lastUpdate: (data['last_update'] as Timestamp).toDate());
    }

    return pod;
  }
}
