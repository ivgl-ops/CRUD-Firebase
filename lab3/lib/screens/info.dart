import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  final String documentSnapshot;
  final String docImage;
  const InfoPage(
      {Key? key, required this.documentSnapshot, required this.docImage})
      : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late final String documentSnapshot;
  late final String img;

  @override
  void initState() {
    super.initState();
    documentSnapshot = widget.documentSnapshot;
    img = widget.docImage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Справочник')),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40),
              height: 400,
              child: Image.network(img),
            ),
            Card(
              margin: const EdgeInsets.all(10),
              child: ListTile(
                title: Text(documentSnapshot, style: TextStyle(),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
