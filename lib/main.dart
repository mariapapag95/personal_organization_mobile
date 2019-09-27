import 'package:flutter/material.dart';
import 'package:calendar_widget/calendar_widget.dart';

void main() => runApp(BulletJournal());

class BulletJournal extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bullet Journal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Bullet Journal Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void action() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Flexible(
                flex: 3,
                child: Row(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(2.0, 20.0, 2.0, 9.0),
                            width: MediaQuery.of(context).size.width * .25,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Thursday',
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  '00',
                                  style: TextStyle(fontSize: 30),
                                ),
                                Text(
                                  'September',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width * .75,
                            padding: EdgeInsets.fromLTRB(25.0, 35.0, 2.0, 9.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                                              child: Text('12:00')),
                                          Container(
                                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                                              child: Text('Dentist Appointment')),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                                              child: Text('2:00')),
                                          Container(
                                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                                              child: Text('Lunch with Mom')),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('TO DO')
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Call bank')
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text('Pick up laundry')
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Flexible(
              flex: 3,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        width: MediaQuery.of(context).size.width / 7,
                        height: MediaQuery.of(context).size.height,
                        child: (Placeholder()));
                  },
                ),
              ),
            ),
            Flexible(
                flex: 4,
                child: Calendar(
                  width: MediaQuery.of(context).size.width,
                  highlightColor: Colors.orange,
                )),
          ],
        ),
      ),
    );
  }
}
