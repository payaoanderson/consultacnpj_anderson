import 'package:flutter/material.dart';
import 'cnpj_controller.dart';
import 'cnpj_data.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}
class HomeViewState extends State<HomeView> {
  final _cnpjController = TextEditingController();
  final _cnpjService = CnpjController();
  CnpjModel? cnpjData;
  final _maskFormatter = MaskTextInputFormatter(
      mask: '##.###.###/####-##', filter: {"#": RegExp(r'[0-9]')});
  void _consultaCnpj() async {
    final cnpj = _cnpjController.text.replaceAll(RegExp(r'\D'), '');
    final data = await _cnpjService.fetchCnpjData(cnpj);
    setState(() {
      cnpjData = data;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consulta de CNPJ'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cnpjController,
              decoration: const InputDecoration(
                labelText: 'CNPJ',
                hintText: '99.999.999/9999-99',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [_maskFormatter], // Aplica a máscara
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _consultaCnpj,
              child: const Text('Consultar'),
            ),
            if (cnpjData != null) ...[
              Text("Razão Social: ${cnpjData!.razaoSocial}"),
              Text("Data de Abertura: ${cnpjData!.dataAbertura}"),
              Text("Logradouro: ${cnpjData!.logradouro}"),
              Text("Número: ${cnpjData!.numero}"),
              Text("Bairro: ${cnpjData!.bairro}"),
              Text("Cidade: ${cnpjData!.cidade}"),
              Text("Estado: ${cnpjData!.estado}"),
              Text("País: ${cnpjData!.pais}"),
              Text("CEP: ${cnpjData!.cep}"),
              const Text("Telefones:"),
              for (var telefone in cnpjData!.telefones) Text("- $telefone"),
            ],
          ],
        ),
      ),
    );
  }
}
