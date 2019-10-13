import 'package:flutter/material.dart';
import 'package:calendar_widget/calendar_widget.dart';
import 'package:intl/intl.dart';
//import 'day.dart';




// TODO :: NEED TO MAKE A WAY TO ADD ITEMS FOR TODO LIST AND SCHEDULED LIST



String today = DateFormat("dd").format(DateTime.now());
int firstDayOfWeek = (DateTime.now()).weekday;
List<String> weekDays = ['MON', 'TUES', 'WED', 'THURS', 'FRI', 'SAT', 'SUN'];
List<String> longWeekDays = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];
int month = (DateTime.now()).month;
List<String> months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

List<String> toDoList;
String userInput;

class BulletJournal extends StatefulWidget {
  BulletJournal({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _BulletJournalState createState() => _BulletJournalState();
}

class _BulletJournalState extends State<BulletJournal> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    toDoList = [];
  }

  weekDay(index) {
    return (int.parse(today) + index).toString();
  }

  textDay(index) {
    if ((firstDayOfWeek - 1) + index > 6) {
      return weekDays[index - 1];
    } else {
      return weekDays[(firstDayOfWeek - 1)];
    }
  }

  openDay(index) {
    print(firstDayOfWeek);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void addToDo(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          userInput = null;
          return SimpleDialog(children: <Widget>[
            Container(
              height: 300.0,
              width: 300.0,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(new Radius.circular(30.0)),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  Text('Add To Do Item', style: TextStyle(fontSize: 20.0),),
                  TextFormField(
                    controller: _controller,
                    onSaved: (val) => setState(() => toDoList.add(val)),
                  ),
                  RaisedButton(
                    child: Text('Add'),
                    onPressed: ()
                    {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                      }
                    },

                    //{userInput = _controller.text; pushToDoList(userInput);},


                  ),
                ],
                ),
              ),
            )
          ]);
        });
  }

  void pushToDoList(input) {
    toDoList.add(input);
  }

//  bottomBar(int index) {
//    if (index == 0) {}
//  }

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
                            padding: EdgeInsets.all(10.0),
                            width: MediaQuery.of(context).size.width * .25,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  longWeekDays[firstDayOfWeek - 1],
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  today,
                                  style: TextStyle(fontSize: 30),
                                ),
                                Text(
                                  months[month - 1],
                                  style: TextStyle(fontSize: 15),
                                ),
                                toDoList.length > 0
                                    ? Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                0.0, 20.0, 0.0, 10.0),
                                            child: Text('TO DO'),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                ListView.builder(
                                                    itemCount: toDoList.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            index) {
                                                      return Text(
                                                          toDoList[index]);
                                                    })
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    : Container(
                                        height: 0,
                                        width: 0,
                                      ),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width * .6,
                            padding: EdgeInsets.all(14.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: Column(
                                    children: <Widget>[
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.0),
                                              child: Text('12:00')),
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.0),
                                              child:
                                                  Text('Dentist Appointment')),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.0),
                                              child: Text('2:00')),
                                          Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5.0),
                                              child: Text('Lunch with Mom')),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * .15,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                FlatButton(
                                  child: Icon(
                                    Icons.add_circle,
                                  ),
                                  onPressed: () => addToDo(context),
                                ),
                                FlatButton(
                                  child: Icon(
                                    Icons.watch_later,
                                  ),
                                  onPressed: () => addToDo(context),
                                ),
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
                    return GestureDetector(
                      onTap: () => openDay(index),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        width: MediaQuery.of(context).size.width / 7,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: Column(
                          children: <Widget>[
                            Text(textDay(index)),
                            Text(weekDay(index)),
                          ],
                        ),
                      ),
                    );
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
//      bottomNavigationBar: BottomNavigationBar(
//        items: [
//          BottomNavigationBarItem(
//            icon: Icon(Icons.add_circle),
//          )
//        ],
//        selectedItemColor: Colors.amber[800],
//        onTap: bottomBar,
//      ),
    );
  }
}
