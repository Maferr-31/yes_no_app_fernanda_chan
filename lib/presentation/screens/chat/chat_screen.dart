import 'package:flutter/material.dart';
import 'package:yes_no_app_fernanda_chan/presentation/widgets/chat/my_message_bubble.dart';

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
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
     child: Padding(
      padding: const EdgeInsets.symmetric( horizontal: 10 ),
      child: Column(
      children: [

        Expanded(
          child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index){
            return MyMessageBubble();
            } )
        ),

        Text('hola mundo')
      ],
      )
    ),
   );
  }
}