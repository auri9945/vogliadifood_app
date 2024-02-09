
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:vogliadifood_app/model/bevande.dart';



Future<List<Bevande>>  fetchBevande() async {

  var regAPIUrl = "http://localhost/AndroidProgetto/vogliadifood/ElencoBevande.php";
  http.Response response = await http.post(Uri.parse(regAPIUrl));
  return bFromJson(response.body);


}

