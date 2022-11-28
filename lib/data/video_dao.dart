// ignore_for_file: unused_import, avoid_print

import 'package:mobflix/components/card_presentation.dart';
import 'package:mobflix/data/database.dart';
import 'package:sqflite/sqlite_api.dart';

class VideoDao {
  static const String tableSql =
      'CREATE TABLE $_tableName($_url TEXT, $_category INTEGER)';

  static const String _tableName = 'videoTable';
  static const String _url = 'url';
  static const String _category = 'category';

  // CRUD: Salvar, Atualizar
  save(CardPresentation card) async {
    print('Iniciando Save');
    final Database database = await getDatabase();
    var itemExists = await find(card.url);
    Map<String, dynamic> videoMap = toMap(card);
    if (itemExists.isEmpty) {
      print('Este vídeo não existia, portanto foi criado');
      return await database.insert(
        _tableName,
        videoMap,
      );
    } else {
      print('Video já existia');
      return await database.update(
        _tableName,
        videoMap,
        where: '$_url = ?',
        whereArgs: [card.url],
      );
    }
  }

  // Converter obejto para mapa
  Map<String, dynamic> toMap(CardPresentation card) {
    print('Convertendo video em Map<>');
    final Map<String, dynamic> videoMap = {};
    videoMap[_url] = card.url;
    videoMap[_category] = card.index;
    print('Map de Video: $videoMap');
    return videoMap;
  }

  // CRUD: Ler
  Future<List<CardPresentation>> findAll() async {
    print('Acessando FindAll');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(_tableName);
    print('Buscando dados no DB');
    print('Encontrado: $result');
    return toList(result);
  }

  // Método toList() converte o Map do banco de dados para Objeto:
  List<CardPresentation> toList(List<Map<String, dynamic>> videoMap) {
    print('Convertendo toList:');
    final List<CardPresentation> videos = [];
    for (Map<String, dynamic> linha in videoMap) {
      final CardPresentation video =
          CardPresentation(url: linha[_url], index: linha[_category]);
      videos.add(video);
    }
    print('Lista de videos $videos');
    return videos;
  }

  // CRUD: Ler (apenas um único obejto)
  Future<List<CardPresentation>> find(String urlDoVideo) async {
    print('Acessando Find');
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(
      _tableName,
      where: '$_url = ?',
      whereArgs: [urlDoVideo],
    );
    print('Tarefa encontrada: ${toList(result)}');
    return toList(result);
  }

  // CRUD: Deletar
  delete(String videoUrl) async {
    print('Deletando Video');
    final Database database = await getDatabase();
    return database.delete(
      _tableName,
      where: '$_url = ?',
      whereArgs: [videoUrl],
    );
  }
}
