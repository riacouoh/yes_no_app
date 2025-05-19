
import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {
    final String answer;
    final bool forced;
    final String image;

    YesNoModel({
        required this.answer,
        required this.forced,
        required this.image,
    });

    factory YesNoModel.fromJson(Map<String, dynamic> json) => YesNoModel(
        answer: json["answer"],
        forced: json["forced"],
        image: json["image"],
    );

    Message toMessageEntity () => Message(
      // si "yes", enviar "Sí" (esp), si "no", enviar "No", si ni yes ni no, "Maybe"
      text: answer =="yes" ? "Sí" : answer == "no" ? "No" : "Maybe",
      fromWho: FromWho.notMe,
      imageUrl: image
    );

}
