// To parse this JSON data, do
//
//     final piatti = piattiFromMap(jsonString);

import 'dart:convert';

List<Piatti> pFromJson(String str) => List<Piatti>.from(json.decode(str).map((x) => Piatti.fromMap(x)));

String pToJson(List<Piatti> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Piatti {
  String id;
  String ristoranteId;
  String piatto;
  String descrizione;
  String prezzo;

  Piatti({
    required this.id,
    required this.ristoranteId,
    required this.piatto,
    required this.descrizione,
    required this.prezzo,
  });

  factory Piatti.fromMap(Map<String, dynamic> json) => Piatti(
    id: json["id"],
    ristoranteId: json["ristorante_id"],
    piatto: json["piatto"],
    descrizione: json["descrizione"],
    prezzo: json["prezzo"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "ristorante_id": ristoranteId,
    "piatto": piatto,
    "descrizione": descrizione,
    "prezzo": prezzo,
  };
}