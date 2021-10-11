import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import '/child_record_editor/bloc/child_record_editor_bloc.dart';

class Child extends Equatable {
  final String? id;
  final String? podId;
  final String? name;
  final String? nic;
  final Gender? gender;
  final DateTime? dob;
  final String? address;
  final String? parentName;
  final String? parentNic;
  final String? contact;

  const Child({
    this.id,
    this.podId,
    this.name,
    this.nic,
    this.gender,
    this.dob,
    this.address,
    this.parentName,
    this.parentNic,
    this.contact,
  });

  @override
  List<Object?> get props => [id, podId, name, nic, gender, dob, address, parentName, parentNic, contact];

  Child copyWith({
    String? id,
    String? podId,
    String? name,
    String? nic,
    Gender? gender,
    DateTime? dob,
    String? address,
    String? parentName,
    String? parentNic,
    String? contact,
  }) {
    return Child(
      id: id ?? this.id,
      podId: podId ?? this.podId,
      name: name ?? this.name,
      nic: nic ?? this.nic,
      gender: gender ?? this.gender,
      dob: dob ?? this.dob,
      address: address ?? this.address,
      parentName: parentName ?? this.parentName,
      parentNic: parentNic ?? this.parentNic,
      contact: contact ?? this.contact,
    );
  }

  factory Child.fromMap(String id, Map<String, dynamic> data) {
    var child = Child(
      id: id,
      podId: data['pod_id'],
      name: data['name'],
      nic: data['nic'],
      address: data['address'],
      parentName: data['parent_name'],
      parentNic: data['parent_nic'],
      contact: data['contact'],
    );

    if (data['gender'] != null) {
      switch (data['gender']) {
        case 0:
          child = child.copyWith(gender: Gender.male);
          break;
        case 1:
          child = child.copyWith(gender: Gender.female);
          break;
      }
    }

    if (data['dob'] != null) {
      child = child.copyWith(dob: (data['dob'] as Timestamp).toDate());
    }

    return child;
  }

  Map<String, dynamic> toMap() {
    return {
      'pod_id': podId,
      'name': name,
      'nic': nic,
      'gender': gender!.index,
      'dob': dob,
      'address': address,
      'parent_name': parentName,
      'parent_nic': parentNic,
      'contact': contact,
    };
  }
}
