import 'dart:io';

import 'usuario.dart';
import 'canal.dart';

final usuarios = <Usuario>[];
final canais = <Canal>[];

String ler(String pergunta) {
  print(pergunta);
  return stdin.readLineSync() ?? '';
}

void criarUsuario({bool moderador = false}) {
  final nick = ler('Digite o nick do usuário:');
  final idade = int.tryParse(ler('Digite a idade do usuário:')) ?? -1;

  if (moderador) {
    usuarios.add(Moderador(nick: nick, idade: idade));
  } else {
    usuarios.add(Usuario(nick: nick, idade: idade));
  }

  print('Criado com sucesso!');
}

void criarCanal() {
  canais.add(Canal(ler('Digite o nome do canal:')));
  print('Criado com sucesso!');
}

void enviarMensagem() {
  final nick = ler('Digite o nick do autor:');
  final nomeCanal = ler('Digite o nome do canal:');

  final usuario = usuarios.where((u) => u.nick == nick).firstOrNull;
  final canal = canais.where((c) => c.nome == nomeCanal).firstOrNull;

  if (usuario == null || canal == null) {
    print('Usuário ou canal não encontrado!');
    return;
  }

  canal.adicionarMensagem(Mensagem(usuario, ler('Mensagem:')));
}

void exibirCanal() {
  final nome = ler('Digite o nome do canal:');
  final canal = canais.where((c) => c.nome == nome).firstOrNull;

  if (canal == null) {
    print('Canal não encontrado!');
    return;
  }

  canal.exibirMensagens();
}

void relatorio() {
  final nome = ler('Digite o nome do canal:');
  final canal = canais.where((c) => c.nome == nome).firstOrNull;

  print('\nDARTCORD');
  print('Servidor: Programação Mobile');

  print('\nUsuários online:');
  for (final u in usuarios.where((u) => u.ativo)) {
    print(u.nick);
  }

  print('\nCanais:');
  for (final c in canais) {
    print('#${c.nome}');
  }

  print('\nExibindo mensagens do canal:');

  if (canal == null) {
    print('Canal não encontrado!');
  } else {
    canal.exibirMensagens();
  }
}

void menu() {
  while (true) {
    print('\nVocê entrou no DARTCORD');
    print('1 - Criar usuário');
    print('2 - Criar moderador');
    print('3 - Criar canal');
    print('4 - Enviar mensagem');
    print('5 - Exibir canal');
    print('6 - Relatório');
    print('0 - Sair');

    switch (int.tryParse(stdin.readLineSync() ?? '') ?? -1) {
      case 1:
        criarUsuario();
        break;
      case 2:
        criarUsuario(moderador: true);
        break;
      case 3:
        criarCanal();
        break;
      case 4:
        enviarMensagem();
        break;
      case 5:
        exibirCanal();
        break;
      case 6:
        relatorio();
        break;
      case 0:
        return;
      default:
        print('Opção inválida!');
    }
  }
}

void main() {
  menu();
}
