class Usuario {
  String nick;
  int idade;
  bool ativo = true;
  Usuario({required this.nick, required this.idade});
}

class Moderador extends Usuario {
  Moderador({required super.nick, required super.idade});
}
