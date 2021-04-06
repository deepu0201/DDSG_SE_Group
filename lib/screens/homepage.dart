import 'package:flutter/material.dart';
import 'package:event_processing_system/models/app_data.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // void callApi() async {
  //   await http.get('api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}');
  // }

  @override
  void initState() {
    // assignAppData(box);
    Provider.of<AppData>(context, listen: false).assignAppData();
    // callApi();
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
            MyContainer(myString: 'Temperature : 25 degree'),
            MyContainer(myString: 'Humidity : 55 percent'),
            MyContainer(
                myString:
                    'Occupancy : ${Provider.of<AppData>(context).occupancy} occupants'),
            MyContainer(
                myString:
                    'Energy : ${Provider.of<AppData>(context).energyConsumption} units'),
            SizedBox(
              height: 200.0,
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
              onPressed: () {
                Navigator.pushNamed(context, '/loginScreen');
              },
              child: Text(
                'Admin Login',
                style: TextStyle(fontSize: 20.0),
              ),
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
