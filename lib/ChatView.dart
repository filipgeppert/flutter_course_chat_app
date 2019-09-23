import 'package:flutter/material.dart';
import 'package:flutter_app_course_safari/ChatMessages.dart';
import 'dart:convert';
import 'package:flutter_app_course_safari/Helper.dart';

class ChatView extends StatefulWidget {

  ChatView({Key key, this.friendName: "", this.lastMessage: "", this.friendId,})
      : super(key: key);

  @override
  _ChatViewState createState() => _ChatViewState();

  final String friendName;
  final String lastMessage;
  final String friendId;
}

class _ChatViewState extends State<ChatView> {
  String _friendInitial;
  TextEditingController _controller = TextEditingController();

  @override
    void initState() {
      setState(() {
        _friendInitial = widget.friendName.substring(0,1);
      });
      super.initState();
    }
  
  @override
  Widget build(BuildContext context) {
    int _index = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.friendName)
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            // Future builder class is used to asynchronously load content
            // It will execute once data comes.
            child: FutureBuilder(
              future: loadJsonFileAsMap(context,
                  'assets/messageDetails.json'),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                List<ChatMessages> chatMessageWidgets = List();
                if(snapshot.connectionState == ConnectionState.done) {
                  if(snapshot.hasData){
                    List<dynamic> chatMessagesList = snapshot.data[widget.friendId]['messages'];
                    print(chatMessagesList);
                    chatMessagesList.forEach((_message){
                        chatMessageWidgets.add(ChatMessages(
                          isFriend: true,
                          isNotPrevious: chatMessagesList.length -1 == _index,
                          message: _message['content'],
                          friendInitial: "T",
                        ));
                        _index += 1;
                    });
                    return ListView(children: chatMessageWidgets,);
                  } else {
                    return Center(child: Text('No messages found.'));
                  }
                } else {
                  return CircularProgressIndicator();

                }
              },
            ),
          ),

          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: TextFormField(
                      controller: _controller,
                      onFieldSubmitted: (String _message) {
                        print("on field submitted "+ _message);
                      },

                      decoration: InputDecoration(
                        hintText: "Type your message here.",
                        labelText: "Message",
                        helperText: "Here's where the message goes."
                  ),
                )),
                IconButton(
                  icon: Icon(Icons.send),
                  color: Colors.blue,
                  onPressed: () {
                    print("Pressed: " + _controller.text);
                  },
                )
              ],
            ),
          ),
        ],
      ),
      );
  }
}

