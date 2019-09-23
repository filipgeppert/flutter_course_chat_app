import 'package:flutter/material.dart';
import 'package:flutter_app_course_safari/ChatHead.dart';
import 'package:flutter_app_course_safari/Helper.dart';

class ChatHistory extends StatefulWidget {
  @override
  _ChatHistoryState createState() => _ChatHistoryState();
}

class _ChatHistoryState extends State<ChatHistory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: FutureBuilder(
          future: loadJsonFileAsMap(context, 'assets/recentChats.json'),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            List<ChatHead> tempList = List();
            if(snapshot.connectionState == ConnectionState.done){
              if (snapshot.hasData){
               Map<String, dynamic> tempMap = snapshot.data;
               tempMap.forEach((_key, _value){
                 DateTime messageTime = DateTime
                     .fromMillisecondsSinceEpoch(_value['last_message']['timestamp']);
                 tempList.add(ChatHead(
                   friendName: _value['display_name'],
                   messageTime: messageTime,
                   lastMessage: _value['last_message']['content'],
                   friendId: _key,
                 ));
               });
               return ListView(children: tempList);
             } else {
               return Text("No chat was found.");
             }
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

