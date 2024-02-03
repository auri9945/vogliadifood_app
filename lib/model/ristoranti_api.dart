
import 'package:http/http.dart' as http;
import 'package:vogliadifood_app/model/ristoranti.dart';



Future<List<Ristoranti>>  fetchRistoranti() async {
  var regAPIUrl = "http://localhost/AndroidProgetto/vogliadifood/ElencoRistoranti.php";
  http.Response response = await http.post(Uri.parse(regAPIUrl));
  return rFromJson(response.body);

}