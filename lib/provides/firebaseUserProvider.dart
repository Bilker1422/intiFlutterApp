import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/models/FirebaseUser.dart';
import 'package:uuid/uuid.dart';

final firebaseUserProvider =
    StateNotifierProvider<FirebaseUserListNotifier, List<FirebaseUser>>(
        (ref) => FirebaseUserListNotifier());

class FirebaseUserListNotifier extends StateNotifier<List<FirebaseUser>> {
  FirebaseUserListNotifier() : super([]);

  void add(String email, String displayName, String photoUrl) {
    var uuid = const Uuid();
    state = [
      ...state,
      FirebaseUser(
        uid: uuid.v1().toString(),
        email: email,
        displayName: displayName,
        photoUrl: photoUrl,
      ),
    ];
  }

  void compete(String id) {
    //   int index = state.indexWhere((element) => element.id == id);
    //   state.elementAt(index).completed = true;
    //   state = [...state];
  }

  void uncompete(String id) {
    //   int index = state.indexWhere((element) => element.id == id);
    //   state.elementAt(index).completed = false;
    //   state = [...state];
  }

  void delete(String id) {
    //   state = state.where((element) => element.id != id).toList();
  }
}
