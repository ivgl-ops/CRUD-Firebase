import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyA_BY3iYE0QPQqJUFG7VFGNPUR8RWrVjwk",
        authDomain: "labsfu.firebaseapp.com",
        projectId: "labsfu",
        storageBucket: "labsfu.appspot.com",
        messagingSenderId: "703289343306",
        appId: "1:703289343306:web:c7bca84baadb08f61f95b3",
        measurementId: "G-QY7RVWR97Q"),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CollectionReference _products =
      FirebaseFirestore.instance.collection('products');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _products.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnaphot) {
          if (streamSnaphot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnaphot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(
                      documentSnapshot['name'],
                    ),
                    subtitle: Text(documentSnapshot['price'].toString()),
                  ),
                );
              },
              itemCount: streamSnaphot.data!.docs.length,
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
