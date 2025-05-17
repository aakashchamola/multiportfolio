class Profile {
  final String name;
  final String title;
  final Contact contact;
  final String summary;

  Profile({
    required this.name,
    required this.title,
    required this.contact,
    required this.summary,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'],
      title: json['title'],
      contact: Contact.fromJson(json['contact']),
      summary: json['summary'],
    );
  }
}

class Contact {
  final String address;
  final String email;
  final String phone;
  final String linkedin;

  Contact({
    required this.address,
    required this.email,
    required this.phone,
    required this.linkedin,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      address: json['address'],
      email: json['email'],
      phone: json['phone'],
      linkedin: json['linkedin'],
    );
  }
}
