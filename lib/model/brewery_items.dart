class Brewery {
  final String id;
  final String name;
  final String breweryType;
  final String? address1;
  final String? address2;
  final String? address3;
  final String city;
  final String stateProvince;
  final String postalCode;
  final String country;
  final double? longitude;
  final double? latitude;
  final String? phone;
  final String? websiteUrl;
  final String? state;
  final String? street;

  Brewery(
  {
  required this.id,
  required this.name,
  required this.breweryType,
  this.address1,
  this.address2,
  this.address3,
  required this.city,
  required this.stateProvince,
  required this.postalCode,
  required this.country,
  this.longitude,
  this.latitude,
  this.phone,
  this.websiteUrl,
  this.state,
  this.street,
  }
);

  factory Brewery.fromJson(Map<String, dynamic> json) {
    return Brewery(
      id: json['id'],
      name: json['name'],
      breweryType: json['brewery_type'],
      address1: json['address_1'],
      address2: json['address_2'],
      address3: json['address_3'],
      city: json['city'],
      stateProvince: json['state_province'] ?? '',
      postalCode: json['postal_code'],
      country: json['country'],
      longitude: json['longitude'] != null ? (json['longitude'] as num?)?.toDouble() : null,
      latitude: json['latitude'] != null ? (json['latitude'] as num?)?.toDouble() : null,
      phone: json['phone'],
      websiteUrl: json['website_url'],
      state: json['state'],
      street: json['street'],
    );
  }
}
