class ChatUser {
  final String id;
  final String name;
  final String email;
  final String password;
  final String imageURL;

  ChatUser({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.imageURL,
  });

  @override
  String toString() {
    return 'ChatUser(id: $id, name: $name, email: $email, password: $password, imageURL: $imageURL)';
  }
}
