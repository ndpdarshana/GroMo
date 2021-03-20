import 'package:equatable/equatable.dart';

class Child extends Equatable {
  final String id;
  final String name;
  final String nik;
  final DateTime dob;
  final String address;
  final String parentName;
  final String parentNik;
  final String contact;

  Child({
    this.id,
    this.name,
    this.nik,
    this.dob,
    this.address,
    this.parentName,
    this.parentNik,
    this.contact,
  });

  @override
  List<Object> get props => [id, name, nik, dob, address, parentName, parentNik, contact];
}
