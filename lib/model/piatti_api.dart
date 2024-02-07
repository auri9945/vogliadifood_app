import 'package:get/get.dart';
import 'package:vogliadifood_app/model/piatti.dart';
import 'package:http/http.dart' as http;



Future<List<Piatti>>  fetchPiatti(String? arguments) async {


  var regAPIUrl = "http://localhost/AndroidProgetto/vogliadifood/ElencaPiatti.php";
  http.Response response = await http.post(Uri.parse(regAPIUrl));
 //return pFromJson(response.body);

  List<Piatti> piatti = pFromJson(response.body);

  // Filtra l'elenco dei piatti in base all'ID del ristorante
  if (arguments != null) {
    piatti = piatti.where((piatto) => piatto.ristoranteId == arguments).toList();
  }

  return piatti;
}




