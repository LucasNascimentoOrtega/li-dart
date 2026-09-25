import 'usuario.dart';

class Mensagem {
  final Usuario autor;
  final String texto;

  Mensagem(this.autor, this.texto);
}

class Canal {
  final String nome;
  final List<Mensagem> _mensagens = [];

  Canal(this.nome);

  void adicionarMensagem(Mensagem msg) {
    _mensagens.add(msg);
  }

  void exibirMensagens() {
    print('#$nome');

    for (final msg in _mensagens) {
      print('${msg.autor.nick}: ${msg.texto}');
    }
  }
}
