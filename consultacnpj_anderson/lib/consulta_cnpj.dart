class CnpjData {
  String? alias;
  String? founded;
  Address? address;
  List<String>? phones;
  List<String>? emails;
  List<Member>? members;
  String? sideActivities;
 
  CnpjData({
    this.alias,
    this.founded,
    this.address,
    this.phones,
    this.emails,
    this.members,
    this.sideActivities,
  });
 
  factory CnpjData.fromJson(Map<String, dynamic> json) {
    return CnpjData(
      alias: json['alias'],
      founded: json['founded'],
      address: Address.fromJson(json['address']),
      phones: List<String>.from(json['phones'].map((x) => x['area'] + x['number'])),
      emails: List<String>.from(json['emails'].map((x) => x['address'])),
      members: (json['company']['members'] as List)
          .map((member) => Member.fromJson(member))
          .toList(),
      sideActivities: json['sideActivities']['text'],
    );
  }
}
 
class Address {
  String? street;
  String? number;
  String? district;
  String? city;
  String? state;
  String? country;
  String? zip;
 
  Address({
    this.street,
    this.number,
    this.district,
    this.city,
    this.state,
    this.country,
    this.zip,
  });
 
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      number: json['number'],
      district: json['district'],
      city: json['city'],
      state: json['state'],
      country: json['country']['name'],
      zip: json['zip'],
    );
  }
}
 
class Member {
  String? name;
  int? age;
 
  Member({this.name, this.age});
 
  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      name: json['name'],
      age: json['age'],
    );
  }
}