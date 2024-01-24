import 'dart:convert';


List<Piatti> pFromJson(String str) => List<Piatti>.from(json.decode(str).map((x) => Piatti.fromMap(x)));

String pToJson(List<Piatti> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Piatti{
  String id;
  String piatto;
  String descrizione;
  String prezzo;
  String carrello;

  Piatti({
    required this.id,
    required this.piatto,
    required this.descrizione,
    required this.prezzo,
    required this.carrello,
});

  factory Piatti.fromMap(Map<String, dynamic> json) => Piatti(
    id: json["id"],
    piatto: json["piatto"],
    descrizione: json["descrizione"],
    prezzo: json["prezzo"],
    carrello: json["carrello"],
);

  Map<String,dynamic> toMap() => {
    "id": id,
    "piatto": piatto,
    "descrizone": descrizione,
    "prezzo": prezzo,
    "carrello": carrello,

};
}