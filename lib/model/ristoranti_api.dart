
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vogliadifood_app/model/ristoranti.dart';



Future<List<Ristoranti>>  fetchRistoranti(String? arguments) async {

  var regAPIUrl = "http://localhost/AndroidProgetto/vogliadifood/ElencoRistoranti.php";
  http.Response response = await http.post(Uri.parse(regAPIUrl));
  // return rFromJson(response.body);

  List<Ristoranti> ristoranti = rFromJson(response.body);

  // Filtra l'elenco dei piatti in base all'ID del ristorante
  if (arguments != null) {
    ristoranti = ristoranti.where((ristorante) => ristorante.id == arguments).toList();
  }

  return ristoranti;

}

Future<List<Ristoranti>>  fetchReadOneR(String? categoriaRistorante) async {

  var regAPIUrl = "http://localhost/AndroidProgetto/vogliadifood/ElencoRistoranti.php";
  http.Response response = await http.post(Uri.parse(regAPIUrl));

  List<Ristoranti> ristorante = rFromJson(response.body);

  if(categoriaRistorante != null){
    ristorante = ristorante.where((ristorante) => ristorante.categoriaRistorante == categoriaRistorante).toList();
  }
  return ristorante;
}







