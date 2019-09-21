import 'package:flutter/material.dart';
import 'package:flutter_app_course_safari/ChatMessages.dart';
import 'dart:convert';

class ChatView extends StatefulWidget {

  ChatView({Key key, this.friendName: "", this.lastMessage: ""})
      : super(key: key);

  @override
  _ChatViewState createState() => _ChatViewState();

  final String friendName;
  final String lastMessage;

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
    loadMessageDetails();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.friendName)
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: FutureBuilder(
              future: loadMessageDetails(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if(snapshot.connectionState == ConnectionState.done) {
                  if(snapshot.hasData){
                    List<ChatMessages> chatMessageWidgets = List();
                    List<dynamic> chatMessagesList = snapshot.data;
                    int _index = 0;
                    chatMessagesList.forEach((_message){
                        chatMessageWidgets.add(ChatMessages(
                          isFriend: true,
                          isNotPrevious: chatMessagesList.length - 1 == _index,
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

  Future<List> loadMessageDetails () async {
    String messageDetailsString = await DefaultAssetBundle.of(context)
        .loadString('assets/messageDetails.json');
        Map<String, dynamic> mappedMessages = json.decode(messageDetailsString);

        List<dynamic> messages = mappedMessages['12345']['messages'];

    return messages;
    }

  List<Widget> getMessages () {
    List<Widget> tempList = List();
    tempList.add(Text('No messages found'));

    loadMessageDetails().then((_value){
      if(_value!=null){


      } else {

      }
    });
    return tempList;
  }
}

