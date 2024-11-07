import 'package:flutter/material.dart';
import 'package:yes_no_app_fernanda_chan/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app_fernanda_chan/domain/entities/message.dart';

//puntos para luis,ader,pablo

class ChatProvider extends ChangeNotifier {
  List<Message> messageList = [
    Message(text: "hola ader", fromWho: FromWho.me),
    Message(text: "lloras?", fromWho: FromWho.me)
  ];
  //controlador
  final ScrollController chatScrollController = ScrollController();

  //Instancia de la clase getyesnoanswere
  final getYesNoAnswer = GetYesNoAnswer();

  Future<void> sendMessage(String text) async {
    //no enviar mensaje vacio
    if (text.trim().isEmpty) return;
    //el mesaje siempre va a ser "me" porque yo lo envio 
    final newMessage = Message(text: text, fromWho: FromWho.me);

    messageList.add(newMessage);

    //agregar una condicion 
    if(text.endsWith('?')) {
      himReply();
    }

    //cantidad de mensajes
    print('cantidad de mensajes: ${messageList.length}');

    notifyListeners();

    moveScrollToBotto();
  }

    //mover el scroll al ultimo mensaje

    Future<void> moveScrollToBotto() async{
      if (chatScrollController.hasClients) {
    //un pequeño atraso en la aplicacion 
     await Future.delayed(const Duration(seconds: 1));
     chatScrollController.animateTo(
      //offset: posicion de la animacion
      //maxscrollextent determina a lo maximo que el scroll puede dar
      chatScrollController.position.maxScrollExtent, 
      //duration de la animation
      duration: const Duration(milliseconds: 300), 
      //"rebote" al final de la aimation
      curve: Curves.easeOut);

      }
  }
   Future<void> himReply() async {
    //obtener el mensaje de la peticion 
    final himMessage = await getYesNoAnswer.getAnswer();
    //añadir el mensaje de mi crush a la lista
    messageList.add(himMessage);
    //notifica si algo de provider
    notifyListeners();
  //mueve el scroll hasta el ultimo mensaje 
    moveScrollToBotto();
   }
}