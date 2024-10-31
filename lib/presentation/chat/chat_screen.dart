import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen ({super.key});

   @override 
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://i.pinimg.com/originals/d1/55/04/d1550433fc3e567643b8393b542f3c27.png'),
           ),
          ),
        title: const Text('Mi amor'),
        centerTitle: false,
      ),
    );
  }
}