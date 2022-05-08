import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) {
    runApp(FirebaseFlutter());
  });
}

class FirebaseFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AppFlutter(),
    );
  }
}

void getUsuario() async {
  List usuarios = [];
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection("usuario");
  QuerySnapshot usuario = await collectionReference.get();
  if (usuario.docs.isNotEmpty) {
    for (var docu in usuario.docs) {
      // ignore: avoid_print
      //usuarios.add(docu.data());
      print(docu.data());
    }
  }
}

class AppFlutter extends StatefulWidget {
  @override
  State<AppFlutter> createState() => _AppFlutterState();
}

class _AppFlutterState extends State<AppFlutter> {
  @override
  void initState() {
    super.initState();
    getUsuario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Demo Flutter'),
        ),
        body: Center(child: Text('Hellow')));
  }
}
