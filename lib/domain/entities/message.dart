
enum FromWho {me, notMe}
//identidad atómica: la unidad más pequeña
class Message {

    final String text;
    final String? imageUrl;
    final FromWho fromWho;
    final String date;
    
  Message( {required this.text, this.imageUrl, required this.fromWho, required this.date});


}