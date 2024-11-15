class CnpjModel {
  final String razaoSocial;
  final String dataAbertura;
  final String logradouro;
  final String numero;
  final String bairro;
  final String cidade;
  final String estado;
  final String pais;
  final String cep;
  final List<String> telefones;
  final List<String> emails;
  final List<Socio> socios;
  final List<String> atividades;
 
  CnpjModel({
    required this.razaoSocial,
    required this.dataAbertura,
    required this.logradouro,
    required this.numero,
    required this.bairro,
    required this.cidade,
    required this.estado,
    required this.pais,
    required this.cep,
    required this.telefones,
    required this.emails,
    required this.socios,
    required this.atividades,
  });
 
  factory CnpjModel.fromJson(Map<String, dynamic> json) {
    return CnpjModel(
      razaoSocial: json['alias'] ?? '',
      dataAbertura: json['founded'] ?? '',
      logradouro: json['address']['street'] ?? '',
      numero: json['address']['number'] ?? '',
      bairro: json['address']['district'] ?? '',
      cidade: json['address']['city'] ?? '',
      estado: json['address']['state'] ?? '',
      pais: json['address']['country']['name'] ?? '',
      cep: json['zip'] ?? '',
      telefones: (json['phones'] as List)
          .map((phone) => "${phone['area']} ${phone['number']}")
          .toList(),
      emails: (json['emails'] as List)
          .map((email) => email['address'] as String)
          .toList(),
      socios: (json['company']['members'] as List)
          .map((member) => Socio.fromJson(member))
          .toList(),
      atividades: (json['sideActivities'] as List)
          .map((activity) => activity['text'] as String)
          .toList(),
    );
  }
}
class Socio {
  final String nome;
  final int idade;
  Socio({
    required this.nome,
    required this.idade,
  });
  factory Socio.fromJson(Map<String, dynamic> json) {
    return Socio(
      nome: json['name'] ?? '',
      idade: json['age'] ?? 0,
    );
  }
}
 