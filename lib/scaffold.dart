import 'package:flutter/material.dart';
import 'package:flutter_app_course_safari/ChatHead.dart';
import 'package:flutter_app_course_safari/ChatView.dart';
import 'package:flutter_app_course_safari/views/ChatHistory.dart';
import 'package:flutter_app_course_safari/views/HomeView.dart';
import 'package:flutter_app_course_safari/views/SettingsView.dart';


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
        body: selectedScreen(_currentIndex),
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
  Widget selectedScreen(int _index){
    switch (_index) {
      case 0:
        return HomeView();
        break;
      case 1:
        return ChatHistory();
        break;
      case 2:
        return SettingsView();
        break;
      default:
        return HomeView();
    }
  }
}

