import 'package:flutter/material.dart';
import 'dart:async';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

dynamic getTime() {
  final dateTimeNow = new DateTime.now();
  String hours = DateTime.now().hour.toString().padLeft(2, '0');
  String minutes = DateTime.now().minute.toString().padLeft(2, '0');
  String seconds = DateTime.now().second.toString().padLeft(2, '0');
  String currentTime = '$hours:$minutes:$seconds';
  Map<int, dynamic> rV = {0: currentTime,1: dateTimeNow};
  return rV;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, Key? key_});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        // Update the dark theme
        primaryColor: Colors.blueGrey, // Update the primary color
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, Key? key_});
  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<int, dynamic> get timeList => getTime();
  String get timeVar => timeList[0];
  String get formatted => DateFormat('MMMMEEEEd').format(timeList[1]);
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), _incrementCounter);
  }

  void _incrementCounter(Timer timer) {
    setState(() {
      
      Map<int, dynamic> timeList = getTime();
      String timeVar = timeList[0];
      String formatted = DateFormat('MMMMEEEEd').format(timeList[1]);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              timeVar,
              style: const TextStyle(
                fontSize: 150.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            Text(
              formatted,
              style: const TextStyle(
                fontSize: 40.0,
//                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
