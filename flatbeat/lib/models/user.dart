class User {
  final String userId;
  final String username;
  final String email;
  // Adicione mais campos conforme necessário

  User({
    required this.userId,
    required this.username,
    required this.email,
    // Inicialize os campos adicionais aqui
  });

  // Método para criar uma instância User a partir de um json
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['userId'],
      username: json['username'],
      email: json['email'],
      // Adicione a conversão dos campos adicionais aqui
    );
  }

  // Método para converter o objeto User para um json
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'username': username,
      'email': email,
      // Adicione os campos adicionais aqui
    };
  }
}
