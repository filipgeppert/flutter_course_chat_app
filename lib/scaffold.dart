import 'package:flutter/material.dart';
import 'package:flutter_app_course_safari/ChatHead.dart';
import 'package:flutter_app_course_safari/ChatView.dart';


class MyChatApp extends StatefulWidget {
  @override
  _MyChatAppState createState() => _MyChatAppState();
}

class _MyChatAppState extends State<MyChatApp> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text("My Char app"),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.help),
                onPressed: () {
                  print("Button was pressed");
                },
              )
            ],
        ),
        body: ListView(
          children: <Widget>[
            ChatHead(
              friendName: "Jacek",
              lastMessage: "Hejo",
              messageTime: DateTime.now(),),
            ChatHead(
              friendName: "Jacek",
              lastMessage: "Hejo",
              messageTime: DateTime.now(),),
            ChatHead(
              friendName: "Boban",
              lastMessage: "Hejo",
              messageTime: DateTime.now(),),
            ChatHead(
              friendName: "Jacek",
              lastMessage: "Hejo",
              messageTime: DateTime.now(),),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              title: Text("Messages"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("Settings"),
            ),
          ],
          onTap: (int index) {
            print("Index is " + index.toString());
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("FAB was pressed");
          },
          child: Icon(Icons.add),
        ),
      )
//    home: ChatView(

//    ),
    );
  }
}

