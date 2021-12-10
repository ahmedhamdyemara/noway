import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth.dart';

class MessageBubbles extends StatelessWidget {
  MessageBubbles(
    this.message,
    this.userName,
    this.userImage,
    this.isMe, {
    this.key,
  });

  final Key key;
  final String message;
  final String userName;
  final String userImage;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    final oppa = Provider.of<Auth>(context, listen: false).userId;

    return Stack(
      children: [
        Row(
          mainAxisAlignment: isMe
              //    oppa == 'xB1Q3KzEaIUNQGM4Fvf88MqUj1g2'
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: isMe
                    //   oppa == 'xB1Q3KzEaIUNQGM4Fvf88MqUj1g2'
                    ? Colors.grey[300]
                    : Colors.amber[100],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: !isMe
//                      oppa != 'xB1Q3KzEaIUNQGM4Fvf88MqUj1g2'
                      ? Radius.circular(0)
                      : Radius.circular(12),
                  bottomRight: isMe
                      //         oppa == 'xB1Q3KzEaIUNQGM4Fvf88MqUj1g2'
                      ? Radius.circular(0)
                      : Radius.circular(12),
                ),
              ),
              width: 140,
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment: isMe
                    //   oppa == 'xB1Q3KzEaIUNQGM4Fvf88MqUj1g2'
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: <Widget>[
                  SelectableText(
                    userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isMe
                          //   oppa == 'xB1Q3KzEaIUNQGM4Fvf88MqUj1g2'
                          ? Colors.black
                          : Theme.of(context).dialogBackgroundColor,
                    ),
                  ),
                  SelectableText(
                    message,
                    style: TextStyle(
                      color: isMe
                          //                        oppa == 'xB1Q3KzEaIUNQGM4Fvf88MqUj1g2'
                          ? Colors.black
                          : Theme.of(context).dialogBackgroundColor,
                    ),
                    textAlign: isMe
//                        oppa == 'xB1Q3KzEaIUNQGM4Fvf88MqUj1g2'
                        ? TextAlign.end
                        : TextAlign.start,
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: isMe
//              oppa == 'xB1Q3KzEaIUNQGM4Fvf88MqUj1g2'
              ? null
              : 120,
          right: isMe
//              oppa == 'xB1Q3KzEaIUNQGM4Fvf88MqUj1g2'
              ? 120
              : null,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              userImage,
            ),
          ),
        ),
      ],
      clipBehavior: Clip.none,
    );
  }
}
