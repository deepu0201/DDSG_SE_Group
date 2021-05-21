import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:event_processing_system/models/app_data.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
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
                          'Occupancy : ${Provider.of<AppData>(context).occupancy}',
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
                          onPressed: () {
                            Provider.of<AppData>(context, listen: false)
                                .handleOccupancySubtraction();
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            Provider.of<AppData>(context, listen: false)
                                .handleOccupancyAddition();
                          },
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
                          'Energy : ${Provider.of<AppData>(context).energyRate}',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        Expanded(child: Container()),
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            Provider.of<AppData>(context, listen: false)
                                .handleEnergyRateSubtraction();
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            Provider.of<AppData>(context, listen: false)
                                .handleEnergyRateAddition();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: 400.0,
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
              onPressed: () {
                Provider.of<AppData>(context, listen: false).handleSaveButton();
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text(
                'Save',
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
