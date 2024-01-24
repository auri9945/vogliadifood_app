import 'package:vogliadifood_app/model/piatti.dart';
import 'package:http/http.dart' as http;



Future<List<Piatti>>  fetchPiatti() async {
  var regAPIUrl = "http://localhost/AndroidProgetto/Vogliadifood/ElencaPiatti.php";
  http.Response response = await http.post(Uri.parse(regAPIUrl));
return pFromJson(response.body);

}

