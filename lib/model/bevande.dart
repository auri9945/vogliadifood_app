// To parse this JSON data, do
//
//     final piatti = piattiFromMap(jsonString);

import 'dart:convert';



List<Bevande> bFromJson(String str) => List<Bevande>.from(json.decode(str).map((x) => Bevande.fromMap(x)));

String bToJson(List<Bevande> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Bevande {

  String bevandeId;
  String bevanda;
  String prezzo;


  Bevande({
    required this.bevandeId,
    required this.bevanda,
    required this.prezzo,

  });

  factory Bevande.fromMap(Map<String, dynamic> json) => Bevande(
    bevandeId: json["bevanda_id"],
    bevanda: json["bevanda"],
    prezzo: json["prezzo"],
  );

  Map<String, dynamic> toMap() => {
    "bevanda_id": bevandeId,
    "bevanda": bevanda,
    "prezzo": prezzo,
  };
}