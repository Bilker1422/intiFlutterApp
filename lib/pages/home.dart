import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/provides/firebaseUserProvider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
        centerTitle: true,
        elevation: 2,
        actions: [
          TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child:
                const Text("Sign out", style: TextStyle(color: Colors.white)),
          )
        ],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final firebaseUsers =
              ref.watch(firebaseUserProvider).reversed.toList();
          return ListView.builder(
            itemCount: firebaseUsers.length,
            itemBuilder: (context, index) {
              final firebaseUser = firebaseUsers[index];
              return ListTile(
                tileColor: firebaseUser.uid != null ? Colors.grey[300] : null,
                title: Text(
                  firebaseUser.displayName,
                  style: firebaseUser.uid != null
                      ? const TextStyle(
                          decoration: TextDecoration.lineThrough,
                        )
                      : null,
                ),
                leading: IconButton(
                  onPressed: () {
                    ref
                        .read(firebaseUserProvider.notifier)
                        .delete(firebaseUser.uid);
                  },
                  icon: firebaseUser.uid != null
                      ? const FaIcon(FontAwesomeIcons.trash)
                      : const FaIcon(FontAwesomeIcons.xmark),
                ),
                trailing: Checkbox(
                  value: firebaseUser.uid != null,
                  onChanged: (value) {
                    if (value!) {
                      ref
                          .read(firebaseUserProvider.notifier)
                          .compete(firebaseUser.uid);
                    } else {
                      ref
                          .read(firebaseUserProvider.notifier)
                          .uncompete(firebaseUser.uid);
                    }
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        child: const FaIcon(FontAwesomeIcons.plus),
      ),
    );
  }
}
