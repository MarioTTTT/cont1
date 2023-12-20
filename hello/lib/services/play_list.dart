import 'package:cloud_firestore/cloud_firestore.dart';

class PlaylistService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> criarPlaylist(String userId, String nomePlaylist, List<String> musicas) async {
    QuerySnapshot<Map<String, dynamic>> playExiste = await _firestore
        .collection('users')
        .doc(userId)
        .collection('playlist')
        .where('nome', isEqualTo: nomePlaylist)
        .get();

     if (playExiste.docs.isNotEmpty) {
        print('Essa playlist ja existe');
          return true;
     }
    try {
      DocumentReference playlistRef = _firestore.collection('users').doc(userId).collection('playlist').doc();

      await playlistRef.set({
        'nome': nomePlaylist,
        'musicas': musicas ?? [], // Inicializa a lista se for nula
        // Outros campos relevantes da playlist, se houver
      });
      return false;
    } catch (e) {
      print('Erro ao criar playlist: $e');
      return false;
    }

    
  }
  

 Future<bool> adicionarMusicaPlaylist(String userId, String playlistId, String musicaId) async {
  DocumentReference playlistRef = _firestore.collection('users').doc(userId).collection('playlist').doc(playlistId);

  try {
    DocumentSnapshot playlistSnapshot = await playlistRef.get();

    if (playlistSnapshot.exists) {
      List<String> musicas = List<String>.from(playlistSnapshot.get('musicas') ?? []);

      // Verifica se a música já está na lista de músicas da playlist
      if (musicas.contains(musicaId)) {
        print('Essa música já está na playlist');
        return true;
      }

      musicas.add(musicaId);
      await playlistRef.update({'musicas': musicas});
      return false;
    }
  } catch (e) {
    print('Erro ao adicionar música à playlist: $e');
    return false;
  }

  // Se houver algum problema durante o processo, retorna false por padrão
  return false;
}
Future<bool> removerMusicaDaPlaylist(String userId, String playlistId, String musicaId) async {
  DocumentReference playlistRef = _firestore.collection('users').doc(userId).collection('playlist').doc(playlistId);

  try {
    DocumentSnapshot playlistSnapshot = await playlistRef.get();

    if (playlistSnapshot.exists) {
      List<String> musicas = List<String>.from(playlistSnapshot.get('musicas') ?? []);

      // Verifica se a música está na lista de músicas da playlist
      if (musicas.contains(musicaId)) {
        musicas.remove(musicaId);
        await playlistRef.update({'musicas': musicas});
        print('Música removida da playlist');
        return true;
      } else {
        print('Essa música não está na playlist');
        return false;
      }
    } else {
      print('A playlist não foi encontrada');
      return false;
    }
  } catch (e) {
    print('Erro ao remover música da playlist: $e');
    return false;
  }
}
Stream<QuerySnapshot<Map<String, dynamic>>> obterPlaylistsUsuario(String userId) {
    return _firestore.collection('users').doc(userId).collection('playlist').snapshots();
  }


  
    Future<List<String>> obterNomesPlaylistsUsuario(String userId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> playlistsSnapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('playlist')
          .get();

      List<String> nomesPlaylists = playlistsSnapshot.docs.map((doc) => doc['nome'] as String).toList();

      return nomesPlaylists;
    } catch (e) {
      print('Erro ao obter nomes das playlists: $e');
      return []; // Retorna uma lista vazia em caso de erro
    }
  }



  
  Future<void> deletarPlaylistPorNome(String userId, String nomePlaylist) async {
    try {
      QuerySnapshot<Map<String, dynamic>> playlistsSnapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('playlist')
          .where('nome', isEqualTo: nomePlaylist)
          .get();

      for (QueryDocumentSnapshot<Map<String, dynamic>> doc in playlistsSnapshot.docs) {
        await doc.reference.delete();
      }
    } catch (e) {
      print('Erro ao deletar playlist por nome: $e');
    }
    }
Future<String?> obterIdPlaylistPorNome(String userId, String nomePlaylist) async {
    try {
      QuerySnapshot<Map<String, dynamic>> playlistsSnapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('playlist')
          .where('nome', isEqualTo: nomePlaylist)
          .get();

      if (playlistsSnapshot.docs.isNotEmpty) {
        // Retorna o ID da primeira playlist encontrada com o nome fornecido
        return playlistsSnapshot.docs.first.id;
      } else {
        // Se não encontrar a playlist, retorna null
        return null;
      }
    } catch (e) {
      print('Erro ao obter ID da playlist por nome: $e');
      return null;
    }
  }


  Future<String?> obterNomePlaylistPorId(String userId, String playlistId) async {
  try {
    DocumentSnapshot<Map<String, dynamic>> playlistSnapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('playlist')
        .doc(playlistId)
        .get();

    if (playlistSnapshot.exists) {
      // Retorna o nome da playlist se ela existir
      return playlistSnapshot.data()?['nome'];
    } else {
      // Se a playlist não existir, retorna null
      return null;
    }
  } catch (e) {
    print('Erro ao obter nome da playlist por ID: $e');
    return null;
  }
}
  Future<List<String>> listarIdsMusicasDaPlaylist(String userId, String playlistId) async {
    try {
      DocumentSnapshot playlistSnapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('playlist')
          .doc(playlistId)
          .get();

      if (playlistSnapshot.exists) {
        List<String> musicasIds = List<String>.from(playlistSnapshot.get('musicas') ?? []);
        return musicasIds;
      } else {
        return []; // Retorna uma lista vazia se a playlist não existir
      }
    } catch (e) {
      print('Erro ao listar IDs das músicas da playlist: $e');
      return []; // Retorna uma lista vazia em caso de erro
    }
  }
  
   Future<bool> adicionarAmigo(String userId, String nomeAmigo, String mensagem) async {
    try {
      // Verificar se o amigo já existe na coleção antes de adicioná-lo
      QuerySnapshot<Map<String, dynamic>> amigoExistente = await _firestore
          .collection('users')
          .doc(userId)
          .collection('amigos')
          .where('nome', isEqualTo: nomeAmigo)
          .get();

      if (amigoExistente.docs.isNotEmpty) {
        print('O amigo $nomeAmigo já existe na coleção de amigos.');
        return false; // Amigo já existe na coleção
      }

      // Verificar se o nome corresponde ao nome presente na tabela com o userId
      DocumentSnapshot<Map<String, dynamic>> userData = await _firestore
          .collection('users')
          .doc(userId)
          .get();

      String nomeUsuario = userData['nome'];
      if (nomeUsuario == nomeAmigo) {
        print('O nome $nomeAmigo corresponde ao nome do usuário.');
        return false; // Nome não corresponde ao nome do usuário
      }

      // Enviar uma solicitação de amizade com mensagem para o amigo
      DocumentReference conviteRef = _firestore.collection('users').doc(nomeAmigo).collection('convites').doc();
      await conviteRef.set({
        'remetente': userId,
        'mensagem': mensagem,
        // Outros campos necessários para a solicitação de amizade
      });

      // Se a mensagem retornar true, então adicionamos o amigo
      if (await receberResposta()) {
        DocumentReference amigosRef = _firestore.collection('users').doc(userId).collection('amigos').doc();
        await amigosRef.set({
          'nome': nomeAmigo,
          // Outros campos do amigo, se necessário
        });
        return true; // Amigo adicionado com sucesso e convite enviado
      } else {
        return false; // Mensagem não foi aceita
      }
    } catch (e) {
      print('Erro ao adicionar amigo: $e');
      return false; // Erro ao adicionar amigo
    }
  }

  Future<bool> receberResposta() async {
    // Aqui você pode implementar a lógica para receber a resposta
    // Pode ser por meio de notificações ou outros meios de comunicação
    // Por enquanto, retorno um valor estático como exemplo
    return true; // Supondo que a resposta seja verdadeira
  }

  
}

