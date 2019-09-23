import 'package:flutter/material.dart';

import 'package:flutter_app_course_safari/ChatView.dart';


class ChatHead extends StatefulWidget {
  @override
  _ChatHeadState createState() => _ChatHeadState();

  final String friendName;
  final String lastMessage;
  final DateTime messageTime;
  final String friendId;

  ChatHead({
    Key key,
    this.friendName: "",
    this.lastMessage: "",
    this.messageTime,
    this.friendId,
  }) : super(key: key);
}

class _ChatHeadState extends State<ChatHead> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        print(widget.friendName + " has been tabbed.");
        await Navigator.of(context).push(MaterialPageRoute<Null>(
          builder: (BuildContext context) {
            return ChatView(
              friendName: widget.friendName,
              lastMessage: widget.lastMessage,
              friendId: widget.friendId,
            );
          },
          fullscreenDialog: true
        ));
      },
        highlightColor: Colors.lightBlueAccent,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        width: double.infinity,
        height: 100.0,
//        color: Colors.grey[300],
        child: Row(
          children: <Widget>[
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                        widget.friendName,
                        style: Theme
                            .of(context)
                            .textTheme
                            .title
                    ),
                    Text(widget.lastMessage,
                        style: Theme
                            .of(context)
                            .textTheme
                            .body2
                    ),
                    Text(widget.messageTime.toString()),
                  ],
                )
            ),
            Center(
              child: CircleAvatar(
                radius: 32.0,
                child: Text(widget.friendName.substring(0,1),
                  style: Theme.of(context).textTheme.display1
                      .apply(color: Colors.white,
                      fontWeightDelta: 3),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}
