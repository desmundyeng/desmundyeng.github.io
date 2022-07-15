import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:simple_cookies/simple_cookies.dart';

class MessageListener extends StatefulWidget {
  const MessageListener({Key? key}) : super(key: key);

  @override
  _MessageListenerState createState() => _MessageListenerState();
}

class _MessageListenerState extends State<MessageListener> {
  String last = 'No messages yet';

  @override
  void initState() {
    html.window.addEventListener('message', listen, true);
    super.initState();
  }

  @override
  void dispose() {
    html.window.removeEventListener('message', listen, true);
    super.dispose();
  }

  void listen(html.Event event) {
    last = Cookies.get('iframe_message') ?? 'Error';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Text(last);
  }
}
