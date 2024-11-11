

// ignore_for_file: unused_local_variable

import 'package:dio/dio.dart';
import 'package:yes_no_app_fernanda_chan/domain/entities/message.dart';
import 'package:yes_no_app_fernanda_chan/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {
  //Se crea instancia de la clase Dio
  //Para manejar las peticiones HTTP
  final _dio = Dio();

  //obtener la respuesta
  Future<Message> getAnswer() async {
//almacenar la peticion get en una variable
    final response = await _dio.get('https://yesno.wtf/api');

 //almacenar la data de la respuesta en una variable
   final yesNoModel = YesNoModel.fromJsonMap(response.data);

    //devolver  la instancio de "menssage" creada en el modelo
   return yesNoModel.toMessageEntiy();
  }
}