import 'dart:io';

import 'usuario.dart';
import 'canal.dart';

final usuarios = <Usuario>[];
final canais = <Canal>[];

String ler(String pergunta) {
  print(pergunta);
  return stdin.readLineSync() ?? '';
}
