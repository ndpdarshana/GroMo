import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/models/app_error.dart';
import '/models/child.dart';

class ChildrenRecordRepositoryResult extends Equatable {
  final List<Child> children;
  final AppError error;

  const ChildrenRecordRepositoryResult({this.children, this.error});

  Child get singleChild {
    return children.first;
  }

  @override
  List<Object> get props => [children, error];
}

class ChildrenRecordRepository {
  static ChildrenRecordRepository _instance = ChildrenRecordRepository._internal();
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference childrenCollection;

  factory ChildrenRecordRepository() {
    return _instance;
  }

  ChildrenRecordRepository._internal() : childrenCollection = _firestore.collection('children');

  Stream<List<Child>> getChildrenList({@required String podId}) {
    assert(podId != null);
    return childrenCollection
        .where('pod_id', isEqualTo: podId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Child.fromMap(doc.id, doc.data())).toList());
  }

  Future<ChildrenRecordRepositoryResult> createChild(Child child) async {
    try {
      DocumentReference documentReference = await childrenCollection.add(child.toMap());
      return Future.value(ChildrenRecordRepositoryResult(children: [child.copyWith(id: documentReference.id)]));
    } on FirebaseException catch (e) {
      print('ChildrenRecordRepository->createChild $e');
      return Future.value(ChildrenRecordRepositoryResult(error: AppError(code: e.code, message: e.message)));
    }
  }
}
