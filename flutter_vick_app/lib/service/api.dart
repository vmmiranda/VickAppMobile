import 'package:http/http.dart' as http;

const baseUrl = "https://jsonplaceholder.typicode.com";

class UsuariosAPI {
  static Future getUsers() async {
    var url = Uri.parse(baseUrl + "/users");
    return await http.get(url);
  }
}
