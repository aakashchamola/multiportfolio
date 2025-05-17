class Profile {
  final String name;
  final String title;
  final Contact contact;
  final String summary;
  final String image;

  Profile(
      {required this.name,
      required this.title,
      required this.contact,
      required this.summary,
      required this.image});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'] ?? '',
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      contact: Contact.fromJson(json['contact']),
      summary: json['summary'] ?? '',
    );
  }
}

class Contact {
  final String address;
  final String email;
  final String phone;
  final String linkedin;
  final String github;

  Contact({
    required this.address,
    required this.email,
    required this.linkedin,
    required this.phone,
    required this.github,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      address: json['address'] ?? "",
      email: json['email'] ?? "",
      phone: json['phone'] ?? "",
      linkedin: json['linkedin'] ?? "",
      github: json['github'] ?? "",
    );
  }
}
