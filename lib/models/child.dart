import 'package:equatable/equatable.dart';

class Child extends Equatable {
  final String id;
  final String name;
  final String nic;
  final DateTime dob;
  final String address;
  final String parentName;
  final String parentNic;
  final String contact;

  Child({
    this.id,
    this.name,
    this.nic,
    this.dob,
    this.address,
    this.parentName,
    this.parentNic,
    this.contact,
  });

  @override
  List<Object> get props => [id, name, nic, dob, address, parentName, parentNic, contact];
}
