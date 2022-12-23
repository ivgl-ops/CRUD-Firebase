import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_prefs_example/const.dart';
import 'package:shared_prefs_example/pages/result_page.dart';
import 'package:shared_prefs_example/utils/user.dart';
import 'package:shared_prefs_example/widgets/calculate_button.dart';
import 'package:shared_prefs_example/widgets/list_item.dart';
import '../widgets/gradient_slider.dart';
import '../widgets/math_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routename = "/home";
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int counterAge;
  late int counterWeight;
  late double counterHeight;
  late bool gender;
  late List<String> userBmi;
  late List<String> userDate;

  @override
  void initState() {
    super.initState();
  }
  // TODO: сделать норм карточку,
  // добавить индикатор нормал плохо или плохо
  // Найти API для тренировка фитнесс

  Widget getAge(String title) {
    return Container(
      width: 180,
      height: 200,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(child: headLine2(title.toString())),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: counterAge < 200 && counterAge > 0
                ? headLineDigit(counterAge.toString())
                : headLine1("text"),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    counterAge++;
                    if (counterAge >= 100) {
                      counterAge = 100;
                    }
                  });
                },
                child: MathButton(
                  text: "+",
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    counterAge--;
                    if (counterAge <= 0) {
                      counterAge = 1;
                    }
                  });
                },
                child: MathButton(
                  text: "-",
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget getWeight(String title) {
    return Container(
      width: 180,
      height: 200,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(child: headLine2(title.toString())),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: counterWeight < 200 && counterWeight > 0
                ? headLineDigit(counterWeight.toString())
                : headLine1("text"),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    counterWeight++;
                    if (counterWeight >= 200) {
                      counterWeight = 200;
                    }
                  });
                },
                child: MathButton(
                  text: "+",
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    counterWeight--;
                    if (counterWeight <= 0) {
                      counterWeight = 1;
                    }
                  });
                },
                child: MathButton(
                  text: "-",
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget getHeight() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
      child: Column(
        children: [
          Center(
            child: headLine2("Height"),
          ),
          const SizedBox(
            height: 5,
          ),
          Center(
            child: Text(
              "cm",
              style: GoogleFonts.openSans(
                  color: const Color.fromARGB(255, 209, 208, 208)),
            ),
          ),
          Center(
            child: headLine40(counterHeight.round().toString()),
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: SliderTheme(
              data: SliderThemeData(
                trackShape: GradientRectSliderTrackShape(
                    gradient: Constants.gradient, darkenInactive: true),
              ),
              child: Slider(
                activeColor: Colors.white,
                inactiveColor: const Color.fromARGB(255, 236, 232, 232),
                min: 90,
                max: 250,
                value: counterHeight,
                onChanged: (double value) {
                  setState(
                    () {
                      counterHeight = value;
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getGender() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
      ),
      margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          headLine30("Man"),
          SizedBox(
            child: Transform.scale(
              scale: 1.6,
              child: Switch(
                activeColor: Colors.pinkAccent,
                inactiveTrackColor: Colors.blue[200],
                inactiveThumbColor: Colors.blue,
                value: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),
            ),
          ),
          headLine30("Woman")
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final reversedUserBmi = userBmi.reversed;
    final reversedUserDate = userDate.reversed;
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      appBar: AppBar(
        title: headLine1("BMI CALCULATOR"),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
          size: 30,
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  getAge('Age'),
                  getWeight('Weight'),
                ],
              ),
            ),
            getHeight(),
            getGender(),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              child: CalculateButton(
                title: "Calculate",
              ),
              onTap: () async {
                // ignore: use_build_context_synchronously
                Navigator.pushNamed(context, ResultPage.routename,
                    arguments:
                        User(counterAge, gender, counterHeight, counterWeight));
              },
            ),
            Container(
              margin: const EdgeInsets.only(left: 20, top: 40),
              child: Align(
                alignment: Alignment.centerLeft,
                child: headLine30("Saved results"),
              ),
            ),
            userBmi.isEmpty
                ? Container(
                    margin: const EdgeInsets.only(left: 22, bottom: 50, top: 5),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: headLine20("Fill in the data"),
                    ),
                  )
                : Column(
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(right: 10, left: 10, top: 25),
                        height: 200,
                        child: ListView.builder(
                          itemCount: userBmi.length,
                          itemBuilder: (BuildContext context, int index) {
                            // return ListTile(
                            //   title: Text(userBmi[index]),
                            //   subtitle: Text(userDate[index]),
                            // );
                            return ListItem(
                                bmi: reversedUserBmi.toList()[index],
                                date: reversedUserDate.toList()[index]);
                          },
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
