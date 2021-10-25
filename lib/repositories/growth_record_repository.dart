import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:growmo/models/app_error.dart';
import 'package:growmo/models/growth_entry.dart';

class GrowthRecordRepositoryResult extends Equatable {
  final List<GrowthEntry>? growthEntries;
  final AppError? error;

  const GrowthRecordRepositoryResult({this.growthEntries, this.error});

  GrowthEntry? get singleEntry => growthEntries?.first;

  @override
  List<Object?> get props => [growthEntries, error];
}

class GrowthRecordRepository {
  static final GrowthRecordRepository _instance = GrowthRecordRepository._internal();
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  factory GrowthRecordRepository() {
    return _instance;
  }

  GrowthRecordRepository._internal();

  CollectionReference _getGrowthRecordsCollection(String childId) {
    return _firestore.collection('children').doc(childId).collection('growth_entries');
  }

  Stream<List<GrowthEntry>> getGrowthEntries({required String childId}) {
    return _getGrowthRecordsCollection(childId).snapshots().map((snapshot) =>
        snapshot.docs.map((doc) => GrowthEntry.fromMap(doc.id, doc.data() as Map<String, dynamic>)).toList());
  }

  Future<GrowthRecordRepositoryResult> createGrowthRecord(String childId, GrowthEntry entry) async {
    try {
      DocumentReference documentReference = await _getGrowthRecordsCollection(childId).add(entry.toMap());
      return Future.value(GrowthRecordRepositoryResult(growthEntries: [entry.copyWith(id: documentReference.id)]));
    } on FirebaseException catch (e) {
      return Future.value(GrowthRecordRepositoryResult(error: AppError(code: e.code, message: e.message)));
    }
  }
}
