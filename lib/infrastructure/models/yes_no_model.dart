//el modelo define que datos debe
//tener la aplicacion. Investigar MVC
//vista: pantalla, controlador: logica 

// To parse this JSON data, do
//
//     final yesNoModel = yesNoModelFromJson(jsonString);

import 'package:yes_no_app_fernanda_chan/domain/entities/message.dart';

class YesNoModel {
    final String answer;
    final bool forced;
    final String image;

    YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

    Message toMessageEntiy() => Message(
      //condicional ternario para darle valor a los mensajes
      text: answer == 'Yes'
      ? 'Si'
      :answer == 'no'
      ? 'No'
      :'Quizas', 
      //siempre va a ser ella
      fromWho: FromWho.him,
      //sera gif
      imageUrl: image);

}
