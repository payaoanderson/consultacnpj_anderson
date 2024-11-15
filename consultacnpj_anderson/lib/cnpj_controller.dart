import 'dart:convert';
import 'package:http/http.dart' as http;
import 'cnpj_data.dart';
class CnpjController {
  Future<CnpjModel?> fetchCnpjData(String cnpj) async {
    final url = Uri.parse('https://open.cnpja.com/office/$cnpj');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return CnpjModel.fromJson(data);
      } else {
        throw Exception('Falha ao carregar dados');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Erro ao consultar CNPJ: $e');
        return null;
    }
  }
}
