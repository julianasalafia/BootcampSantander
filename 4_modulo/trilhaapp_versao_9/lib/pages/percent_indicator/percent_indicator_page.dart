import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PercentIndicatorPage extends StatefulWidget {
  const PercentIndicatorPage({super.key});

  @override
  State<PercentIndicatorPage> createState() => _PercentIndicatorPageState();
}

class _PercentIndicatorPageState extends State<PercentIndicatorPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Percent Indicator'),
        ),
        body: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircularPercentIndicator(
                radius: 60.0,
                lineWidth: 5.0,
                percent: 0.5,
                center: const Text("100%"),
                progressColor: Colors.green,
              ),
              const SizedBox(height: 10),
              CircularPercentIndicator(
                radius: 60.0,
                animation: true,
                animationDuration: 1200,
                lineWidth: 5.0,
                percent: 0.4,
                center: const Text(
                  "40 hours",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                circularStrokeCap: CircularStrokeCap.butt,
                backgroundColor: Colors.yellow,
                progressColor: Colors.red,
              ),
              const SizedBox(height: 10),
              LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2000,
                percent: 0.7,
                center: const Text("70.0%"),
                progressColor: Colors.greenAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
