import 'dart:convert';
import 'package:http/http.dart' as http;
import 'consulta_cnpj.dart';

class CnpjController {
  final url = Uri.parse("https://open.cnpja.com/office/37335118000180");
  Future<CnpjData?> consultaCnpj(String cnpj) async {
    cnpj = cnpj.replaceAll(RegExp(r'[^0-9]'), '');
    try {
      final response = await http.get(Uri.parse('$url/$cnpj'));
      if (response.statusCode == 200) {
   return CnpjData.fromJson(json.decode(response.body));
      } else {
        throw Exception('falha ao consultar a cnpj');
      }
    } catch (e) {
      throw Exception('erro ao consultar a cnpj: $e');
    }
  }
}
