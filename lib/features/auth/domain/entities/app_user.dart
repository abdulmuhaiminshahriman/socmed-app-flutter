class AppUser {
  final String uuid;
  final String name;
  final String email;

  AppUser({
    required this.uuid,
    required this.name,
    required this.email,
  });

  // helper methods 1: convert app user to json (to storing data in the database)
  Map<String, dynamic> toJson() => {
    'uuid': uuid,
    'name': name,
    'email': email,
  };

  // helper methods 2: convert json to app user
  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
    uuid: json['uuid'],
    name: json['name'],
    email: json['email'],
  );
}