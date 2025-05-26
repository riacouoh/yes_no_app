
import 'package:yes_no_app/domain/entities/message.dart';
import 'dart:math';
import 'package:intl/intl.dart';

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

    List<String> posAnswers = ["Yes", "Sure!!!", "Of course!"];
    List <String> negAnswers = ["No", "Nope!", "Absolutely not."];
    List <String> ehAnswers = ["Eh", "Whatever", "Maybe"];
    
    int answerNum = Random().nextInt(3);
    final now = DateTime.now();

    String formatDate(DateTime toChange) {
      String formattedTime = DateFormat.Hms().format(now);
      return formattedTime;
    }
    
    Message toMessageEntity () => Message(
      // si "yes", enviar "Sí" (esp), si "no", enviar "No", si ni yes ni no, "Maybe"
      text: answer =="yes" ? posAnswers[answerNum] : answer == "no" ? negAnswers[answerNum] : ehAnswers[answerNum],
      fromWho: FromWho.notMe,
      imageUrl: image,
      date: formatDate(now),
    );

}
