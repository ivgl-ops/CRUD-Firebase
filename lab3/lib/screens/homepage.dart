import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_get/screens/info.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// text fields' controllers

  final CollectionReference _products =
      FirebaseFirestore.instance.collection('guide');

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Справочник')),
        ),
        body: StreamBuilder(
          stream: _products.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if (streamSnapshot.hasData) {
              return ListView.builder(
                itemCount: streamSnapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final DocumentSnapshot documentSnapshot =
                      streamSnapshot.data!.docs[index];
                  return Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      title: Text(documentSnapshot['name']),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                                icon: const Icon(Icons.arrow_right),
                                onPressed: () => {
                                      print(streamSnapshot.data!.docs[index]),
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (context) {
                                        return InfoPage(
                                          documentSnapshot:
                                              documentSnapshot['definition'],
                                          docImage: documentSnapshot['img'],
                                        );
                                      }))
                                    }),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
// Add new product
  }
}
