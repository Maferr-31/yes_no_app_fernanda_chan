import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app_fernanda_chan/domain/entities/message.dart';
import 'package:yes_no_app_fernanda_chan/presentation/providers/chat_provider.dart';
import 'package:yes_no_app_fernanda_chan/presentation/widgets/chat/him_message_bubble.dart';
import 'package:yes_no_app_fernanda_chan/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app_fernanda_chan/presentation/widgets/chat/screens/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen ({super.key});

   @override 
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(
         title: const Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('lib/imagenes/henry-papucho-cavill.jpg'),
              radius: 20, // Tamaño del avatar
            ),
            SizedBox(width: 10), // Espacio entre la imagen y el nombre
            Column(
              crossAxisAlignment: CrossAxisAlignment
                  .start, // Alineamos el nombre a la izquierda
              children: [
                Text(
                  'Herny papucho Cavil',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4), // Espacio entre el nombre y el subtítulo
                Text(
                  'En línea',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
        // Este botón está al final del AppBar, si necesitas agregar un botón
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

    final chatProvider = context.watch<ChatProvider>();
    return SafeArea(
     child: Padding(
      padding: const EdgeInsets.symmetric( horizontal: 10 ),
      child: Column(
      children: [

        Expanded(
          child: ListView.builder(
            controller: chatProvider.chatScrollController,
            itemCount: chatProvider.messageList.length,
            itemBuilder: (context, index){
              //instancia de message que sabra de quien es el mesaje
              final message = chatProvider.messageList[index];
            return ( message.fromWho == FromWho.him)
              ? HimMessageBubble(
                message: message,)
              : MyMessageBubble(
                message: message,);
            })),

          ///caja de texto
        MessageFieldBox(
          //una vez que tenga el valor cambiado, envialo
          onValue: chatProvider.sendMessage),
      ],
      )
    ),
   );
  }
}