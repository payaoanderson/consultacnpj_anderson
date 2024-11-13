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

  factory CnpjData.fromJSON(Map<String, dynamic> json) {
    return CnpjData(
      alias: json["alias"],
      founded: json["founded"],
      address: Address.fromJSON(json["address"]),
      phones: List<String>.from(json["phones"].map((x) => x['area'] + x['number'])),
      emails: List<String>.from(json["phones"].map((x) => x['address'])),
      members: (json['company']['members'] as List)
      .map((member) => member.fromJSON(member)).toList().
      sideActivities: json["sideActivities"]['Text'],
    );
  }
}

class Address{
  String? street;
  String? number;
  String? district;
  String? city;
  String? state;
  String? country;
  String? zip;
}

Address ({
 this.street,
});
