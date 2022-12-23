import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_prefs_example/const.dart';
import 'package:shared_prefs_example/pages/home_page.dart';
import 'package:shared_prefs_example/utils/user.dart';
import 'package:shared_prefs_example/widgets/calculate_button.dart';


class ResultPage extends StatefulWidget {
  const ResultPage({
    Key? key,
  }) : super(key: key);
  static const routename = "/result";

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late List<String> dataBmi;
  late List<String> dataDate;

  @override
  void initState() {
    super.initState();
  }

  num getResult(int weight, double height) {
    height = height / 100;
    num total = (weight / (height * height));
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as User;
    num total = getResult(args.weight, args.height) - 1;
    var totalRemainder = (total - (total.round() - 1)) * 100;

    return Scaffold(
        backgroundColor: const Color(0xffF6F7FB),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 400,
                height: 700,
                margin: const EdgeInsets.symmetric(
                    horizontal: 40.0, vertical: 60.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 80, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          resultText("${total.round()}"),
                          Padding(
                              padding: const EdgeInsets.only(top: 35),
                              child: resultTextRemains(
                                  ".${totalRemainder.toStringAsFixed(0)}")),
                        ],
                      ),
                    ),
                    total < 15.99
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              dangerText(
                                  "Pronounced body weight deficiency", 0),
                              Center(
                                child: recomendations(
                                    "Recommendations: Urgent specialist consultation is needed"),
                              )
                            ],
                          )
                        : total > 16.00 && total < 18.49
                            ? Column(
                                children: [
                                  warningText(
                                      "Insufficient (deficiency) body weight"),
                                  Center(
                                    child: recomendations(
                                        "Recommendations: Specialist consultation is required"),
                                  )
                                ],
                              )
                            : total > 18.50 && total < 24.99
                                ? normal("Normal")
                                : total > 25.00 && total < 29.99
                                    ? Column(
                                        children: [
                                          warningText(
                                              "Overweight (pre-obesity)"),
                                          Center(
                                            child: recomendations(
                                                "Recommendations: Specialist consultation is required"),
                                          )
                                        ],
                                      )
                                    : total > 30.00 && total < 34.99
                                        ? Column(
                                            children: [
                                              dangerText(
                                                  "Obesity of the first degree",
                                                  0),
                                              Center(
                                                child: recomendations(
                                                    "Recommendation: Specialist consultation is required"),
                                              )
                                            ],
                                          )
                                        : total > 35.00 && total < 39.99
                                            ? Column(
                                                children: [
                                                  dangerText(
                                                      "Obesity of the second degree",
                                                      0),
                                                  Center(
                                                    child: recomendations(
                                                        "Recommendation: Specialist consultation is required"),
                                                  )
                                                ],
                                              )
                                            : total > 40
                                                ? Column(
                                                    children: [
                                                      dangerText(
                                                          "Obesity of the third degree (morbid)",
                                                          0),
                                                      Center(
                                                        child: recomendations(
                                                            "Recommendation: Specialist consultation is required"),
                                                      )
                                                    ],
                                                  )
                                                : Column(
                                                    children: [
                                                      dangerText(
                                                          "Obesity of the fourth degree",
                                                          0),
                                                      Center(
                                                        child: recomendations(
                                                            "Recommendation: Specialist consultation is required"),
                                                      ),
                                                    ],
                                                  ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      child: CalculateButton(title: "Save Data"),
                      onTap: () async {
                        var now = DateTime.now();
                        var formatter = DateFormat('yyyy-MM-dd');
                        String formattedDate = formatter.format(now);
                        dataBmi.add((total).toStringAsFixed(2));
                        dataDate.add(formattedDate);
                        print(dataDate);
                        // ignore: use_build_context_synchronously
                        Navigator.pushNamed(context, HomePage.routename);
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: CalculateButton(title: "Back"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
