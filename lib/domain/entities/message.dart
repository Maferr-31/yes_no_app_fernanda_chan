
enum FromWho{me, him}

class Message {
 final String Text;
 final String? imageUrl;
 final FromWho fromWho;

  Message({required this.Text, required this.fromWho});
 
}