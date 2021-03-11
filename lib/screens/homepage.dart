import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
            MyContainer(myString: 'Temprature : 25 degree'),
            MyContainer(myString: 'Humidity : 55 percent'),
            MyContainer(myString: 'Occupance : 20 occupants'),
            MyContainer(myString: 'Energy : 25 units'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/loginScreen');
        },
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
