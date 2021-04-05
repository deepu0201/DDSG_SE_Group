import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int occupancy = 20;
  double energyRate = 1.25;

  void handleOccupancyAddition() {
    setState(() {
      occupancy += 1;
    });
  }

  void handleOccupanceSubtraction() {
    setState(() {
      occupancy -= 1;
    });
  }

  void handleEnergyRateAddition() {
    setState(() {
      energyRate += 0.25;
    });
  }

  void handleEnergyRateSubtraction() {
    setState(() {
      energyRate -= 0.25;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Text(
                  'Admin Console',
                  style: TextStyle(
                    fontSize: 40.0,
                  ),
                ),
              ),
            ),
            Padding(
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          'Occupancy : $occupancy',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        // SizedBox(
                        //   width: 100.0,
                        // ),
                        Expanded(child: Container()),
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: handleOccupanceSubtraction,
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: handleOccupancyAddition,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Text(
                          'Energy : $energyRate',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        // SizedBox(
                        //   width: 20.0,
                        // ),
                        Expanded(child: Container()),
                        // Container(
                        //   width: 40,
                        //   child: TextField(
                        //   ),
                        // ),
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: handleEnergyRateSubtraction,
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: handleEnergyRateAddition,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 400.0,
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
                Navigator.pushNamed(context, '/');
              },
              child: Text(
                'Save',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
