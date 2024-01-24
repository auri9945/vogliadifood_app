import 'package:vogliadifood_app/model/piatti.dart';
import 'package:http/http.dart' as http;

Future<List<Piatti>>  fetchPiatti() async {
String url ="http://localhost/AndroidProgetto/vogliadifood/ElencaPiatti.php";
final response = await http.get(url as Uri);
return pFromJson(response.body);

}

