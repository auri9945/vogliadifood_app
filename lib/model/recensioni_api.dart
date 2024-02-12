import 'package:get/get.dart';
import 'package:vogliadifood_app/model/piatti.dart';
import 'package:http/http.dart' as http;
import 'package:vogliadifood_app/model/recensioni.dart';


Future<List<Recensioni>>  fetchRecensioni(String? arguments) async {


  var regAPIUrl = "http://localhost/AndroidProgetto/vogliadifood/ElencoRecensioni.php";
  http.Response response = await http.post(Uri.parse(regAPIUrl));

  List<Recensioni> recensioni = xFromJson(response.body);

  // Filtra l'elenco dei piatti in base all'ID del ristorante
  if (arguments != null) {
    recensioni = recensioni.where((recensione) => recensione.ristoranteId == arguments).toList();
  }

  return recensioni;
}





