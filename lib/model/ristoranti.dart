// To parse this JSON data, do
//
//     final piatti = piattiFromMap(jsonString);

import 'dart:convert';


List<Ristoranti> rFromJson(String str) => List<Ristoranti>.from(json.decode(str).map((x) => Ristoranti.fromMap(x)));

String rToJson(List<Ristoranti> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Ristoranti {

  String id;
  String nomeRistorante;
  String categoriaRistorante;
  String tempoConsegna;

  Ristoranti({
    required this.id,
    required this.nomeRistorante,
    required this.categoriaRistorante,
    required this.tempoConsegna,
  });

  factory Ristoranti.fromMap(Map<String, dynamic> json) => Ristoranti(
    id: json["id"],
    nomeRistorante: json["nome_ristorante"],
    categoriaRistorante: json["categoria_ristorante"],
    tempoConsegna: json["tempo_consegna"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "nome_ristorante": nomeRistorante,
    "categoria_ristorante": categoriaRistorante,
    "tempo_consegna": tempoConsegna,
  };
}