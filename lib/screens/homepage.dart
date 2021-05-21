import 'package:flutter/material.dart';
import 'package:event_processing_system/models/app_data.dart';
import 'package:provider/provider.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:event_processing_system/services/weather.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double temperature;
  int humidity;

  Future<String> loadAsset() async {
    return await rootBundle.loadString('assets/api_key.txt');
  }

  Future<dynamic> fetchData() async {
    var myKey = await loadAsset();

    var weatherData = await WeatherModel().getCityWeather('Allahabad', myKey);
    temperature = weatherData['main']['temp'];
    humidity = weatherData['main']['humidity'];

    setState(() {
      // To display fetched data in the widget tree
    });

    // print(temperature);
    // print(humidity);
  }

  @override
  void initState() {
    // assignAppData(box);
    Provider.of<AppData>(context, listen: false).assignAppData();
    // callApi();
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  'Smart Building',
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Center(
                child: Text(
                  'Event Processing System',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
            MyContainer(
              myString: (temperature != null)
                  ? 'Temperature : ${temperature.toStringAsFixed(2)} degree'
                  : 'Temperature : fetching...',
            ),
            MyContainer(
              myString: (humidity != null)
                  ? 'Humidity : $humidity percent'
                  : 'Humidity : fetching...',
            ),
            MyContainer(
                myString:
                    'Occupancy : ${Provider.of<AppData>(context).occupancy} occupants'),
            MyContainer(
                myString:
                    'Energy : ${Provider.of<AppData>(context).energyConsumption} units'),
            // SizedBox(
            //   height: 200.0,
            // ),
            Expanded(
              flex: 2,
              child: Container(),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 80.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                side: BorderSide(color: Colors.lightBlue[800]),
              ),
              onPressed: () async {
                Navigator.pushNamed(context, '/loginScreen');
              },
              child: Text(
                'Admin Login',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

class MyContainer extends StatelessWidget {
  MyContainer({@required this.myString});

  final String myString;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        width: double.infinity,
        height: 60.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
            width: 3.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Center(
          child: Text(
            myString,
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
