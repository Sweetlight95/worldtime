import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};


  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings?.arguments as Map;
    print(data);

    //set background
    String bgImage = data['isDaytime'] ? 'day.jpg' : 'night.jpeg';
    Color bgColor = data['isDaytime'] ? Colors.lightGreen : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                      onPressed:  () async {
                        dynamic results = await  Navigator.pushNamed(context, '/location');
                        setState(() {
                          data = {
                            'time': results['time'],
                            'location': results['location'],
                            'flag': results['flag'],
                            'isDaytime': results['isDaytime'],
                          };
                        });
                      },
                      icon: Icon(
                          Icons.edit_location,
                          color: Colors.red[900],
                      ),
                      label: Text(
                          'Edit location',
                          style: TextStyle(
                          color: Colors.red[900],
                      ),
                      ),
                  ),
                   SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 20.0,
                          letterSpacing: 2.0,
                          color: Colors.red[700],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.red[600],
                    ),
                  ),
                ],
              ),
            ),
          ),
      ),
    );
  }
}
