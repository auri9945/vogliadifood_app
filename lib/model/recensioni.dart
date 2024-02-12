// To parse this JSON data, do
//
//     final piatti = piattiFromMap(jsonString);

import 'dart:convert';


List<Recensioni> xFromJson(String str) => List<Recensioni>.from(json.decode(str).map((x) => Recensioni.fromMap(x)));

String xToJson(List<Recensioni> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Recensioni {
  String id;
  String ristoranteId;
  String recensione;
  String rate;


  Recensioni({
    required this.id,
    required this.ristoranteId,
    required this.recensione,
    required this.rate,

  });

  factory Recensioni.fromMap(Map<String, dynamic> json) => Recensioni(
    id: json["id"],
    ristoranteId: json["ristorante_id"],
    recensione: json["recensione"],
    rate: json["rate"],


  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "ristorante_id": ristoranteId,
    "recensione": recensione,
    "descrizione": rate,


  };
}