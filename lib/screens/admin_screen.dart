import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
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
                          'Occupancy : 21',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        // SizedBox(
                        //   width: 100.0,
                        // ),
                        Expanded(child: Container()),
                        IconButton(icon: Icon(Icons.remove), onPressed: () {}),
                        IconButton(icon: Icon(Icons.add), onPressed: () {}),
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
                          'Energy : 1.25',
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
                        IconButton(icon: Icon(Icons.remove), onPressed: () {}),
                        IconButton(icon: Icon(Icons.add), onPressed: () {}),
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
