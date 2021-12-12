import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class GrowthEntry extends Equatable {
  final String? id;
  final double weight;
  final double height;
  final bool asi;
  final bool bgm;
  final bool pmt;
  final bool vitaminA;
  final bool t2;
  final bool immunization;
  final Timestamp? timestamp;

  const GrowthEntry({
    this.id,
    this.weight = 0.0,
    this.height = 0.0,
    this.asi = false,
    this.bgm = false,
    this.pmt = false,
    this.t2 = false,
    this.vitaminA = false,
    this.immunization = false,
    this.timestamp,
  });

  @override
  List<Object?> get props => [id, weight, height, asi, bgm, pmt, vitaminA, t2, immunization, timestamp];

  double weightToAgeRatio(int monthsSinceBirth) => weight / monthsSinceBirth;
  double heightToAgeRatio(int monthsSinceBirth) => height / monthsSinceBirth;

  GrowthEntry copyWith({
    String? id,
    double? weight,
    double? height,
    bool? asi,
    bool? bgm,
    bool? pmt,
    bool? vitaminA,
    bool? t2,
    bool? immunization,
    Timestamp? timestamp,
  }) =>
      GrowthEntry(
        id: id ?? this.id,
        weight: weight ?? this.weight,
        height: height ?? this.height,
        asi: asi ?? this.asi,
        bgm: bgm ?? this.bgm,
        pmt: pmt ?? this.pmt,
        vitaminA: vitaminA ?? this.vitaminA,
        t2: t2 ?? this.t2,
        immunization: immunization ?? this.immunization,
        timestamp: timestamp ?? this.timestamp,
      );

  factory GrowthEntry.fromMap(String id, Map<String, dynamic> data) => GrowthEntry(
        id: id,
        weight: data['weight'],
        height: data['height'],
        asi: data['asi'],
        bgm: data['bgm'],
        pmt: data['pmt'],
        t2: data['t2'],
        vitaminA: data['vitaminA'],
        immunization: data['immunization'],
        timestamp: data['createdAt'],
      );

  Map<String, dynamic> toMap() {
    return {
      'weight': weight,
      'height': height,
      'asi': asi,
      'bgm': bgm,
      'pmt': pmt,
      't2': t2,
      'vitaminA': vitaminA,
      'immunization': immunization,
      'createdAt': FieldValue.serverTimestamp()
    };
  }
}
