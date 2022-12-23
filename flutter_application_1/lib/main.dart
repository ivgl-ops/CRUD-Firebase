// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

enum SingingCharacter1 { male, female }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  SingingCharacter1? _character = SingingCharacter1.male;
  bool isChecked = false;
  bool isChecked1 = false;
  final myController = TextEditingController();
  final myController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Лабораторная №1"),
      ),
      body: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Container(
            margin: const EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 15, top: 10),
                  child: const Text(
                    "Ваше имя",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                CustomTextField(
                  name: myController,
                )
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 15, top: 10),
                child: const Text(
                  "Ваше Фамилия",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              CustomTextField(
                name: myController1,
              )
            ],
          ),
          Column(
            children: [
              ListTile(
                title: const Text('Male'),
                leading: Radio<SingingCharacter1>(
                  value: SingingCharacter1.male,
                  groupValue: _character,
                  onChanged: (SingingCharacter1? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Female'),
                leading: Radio<SingingCharacter1>(
                  value: SingingCharacter1.female,
                  groupValue: _character,
                  onChanged: (SingingCharacter1? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 16),
            child: Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  value: isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                const Text("Школьник"),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 16),
            child: Row(
              children: [
                Checkbox(
                  checkColor: Colors.white,
                  value: isChecked1,
                  onChanged: (bool? value) {
                    setState(() {
                      isChecked1 = value!;
                    });
                  },
                ),
                const Text("Студент"),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              showAlertDialog(context, myController.text, myController1.text);
            },
            child: Container(
              margin: const EdgeInsets.only(left: 50, top: 20, right: 50),
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.blue),
              child: const Center(
                child: Text(
                  "Отправить запрос",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  const CustomTextField({super.key, required this.name});
  final TextEditingController name;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late TextEditingController name;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = widget.name;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: name,
        decoration: const InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15.0))),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context, String name, String secondName) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title:  Text("${name} ${secondName} "),
    content: const Text("Ваш запрос отправлен"),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
