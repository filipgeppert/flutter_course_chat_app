import 'package:flutter/material.dart';


class ChatMessages extends StatefulWidget {
  @override
  _ChatMessagesState createState() => _ChatMessagesState();
  final bool isFriend;
  final bool isNotPrevious;
  final String message;
  final String friendInitial;
  final String avatarUrl;

  ChatMessages({
    Key key,
    this.isFriend : false,
    this.isNotPrevious: true,
    this.message: "",
    this.friendInitial,
    this.avatarUrl,
  }) : super(key: key);
}

class _ChatMessagesState extends State<ChatMessages> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      padding: EdgeInsets.all(4.0),
      width: double.infinity,
      color: Colors.grey[300],
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 40.0,
            child: widget.isFriend && widget.isNotPrevious ?
            CircleAvatar(
              backgroundImage: Image.asset('assets/images/57.jpg').image,
              radius: 20.0,
              backgroundColor: Colors.white,
              child: Text(widget.friendInitial),
            ) : Container(),
          ),
          Expanded(child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(widget.message)
          ),
          ),
          !widget.isFriend  && widget.isNotPrevious ?
          CircleAvatar(
            backgroundImage: Image.asset('assets/images/57.jpg').image,
            radius: 20.0,
            backgroundColor: Colors.white,
            child: Text("U"),
          ): Container(),
        ],
      )
    );
  }
}
