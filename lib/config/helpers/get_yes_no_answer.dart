
import 'package:dio/dio.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {

  //instancia de la clase Dio para manejar peticiones http
  final _dio = Dio();


  Future<Message> getAnswer() async{
    //almacenar el resultado de la patición
    final response = await _dio.get("https://yesno.wtf/api");


    final yesNoModel = YesNoModel.fromJson(response.data);

    //return la instancia de Message
    return yesNoModel.toMessageEntity();

    //generar un error por si falla el servidor (si no hay retorno)
    //throw UnimplementedError();
  }

}