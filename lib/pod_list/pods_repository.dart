import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import '/models/app_error.dart';
import '/models/pod.dart';

class PodsRepositoryResult extends Equatable {
  final List<Pod> pods;
  final AppError error;

  const PodsRepositoryResult({this.pods, this.error});

  @override
  List<Object> get props => [pods, error];
}

class PodsRepository {
  static PodsRepository _instance = PodsRepository._intarnal();
  static FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference podsCollection;

  factory PodsRepository() {
    return _instance;
  }

  PodsRepository._intarnal() : podsCollection = _firestore.collection('pods');

  Future<PodsRepositoryResult> getPodList() async {
    try {
      QuerySnapshot snapshot = await podsCollection.get();
      final pods = snapshot.docs.map<Pod>((snapshot) => Pod.fromMap(snapshot.id, snapshot.data())).toList();
      return Future.value(PodsRepositoryResult(pods: pods));
    } on FirebaseException catch (e) {
      print('PodsRepository->getPodList $e');
      return Future.value(PodsRepositoryResult(error: AppError(code: e.code, message: e.message)));
    }
  }
}
