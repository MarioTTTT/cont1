import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hello/services/autentica_service.dart';

class AmigosService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
 Future<bool> adicionarAmigo(String userId, String nomeAmigo) async {
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

    DocumentReference amigosRef = _firestore.collection('users').doc(userId).collection('amigos').doc();

    // Cria um documento na coleção 'amigos' para armazenar os dados do amigo
    await amigosRef.set({
      'nome': nomeAmigo,
      // Outros campos do amigo, se necessário
    });

    // Adicionando o próprio usuário como amigo do amigo
    String? idAmigo = await AutenticacaoServico().buscarIDPorNome(nomeAmigo);
    if (idAmigo != null) {
      DocumentReference amigoDoAmigoRef = _firestore.collection('users').doc(idAmigo).collection('amigos').doc();
      await amigoDoAmigoRef.set({
        'nome': nomeUsuario,
        // Outros campos do usuário, se necessário
      });
    }

    return true; // Amigo adicionado com sucesso
  } catch (e) {
    print('Erro ao adicionar amigo: $e');
    return false; // Retorna false em caso de erro
  }
}
 
Future<bool> removerAmigoPorNome(String userId, String nomeAmigo) async {
  try {
    // Remove o usuário atual da lista de amigos do amigo pelo nome
    QuerySnapshot<Map<String, dynamic>> amigosDoAmigo = await _firestore
        .collection('users')
        .where('nome', isEqualTo: nomeAmigo)
        .get();

    if (amigosDoAmigo.docs.isNotEmpty) {
      for (var amigo in amigosDoAmigo.docs) {
        await _firestore
            .collection('users')
            .doc(amigo.id)
            .collection('amigos')
            .where('nome', isEqualTo: nomeAmigo)
            .get()
            .then((QuerySnapshot snapshot) {
          snapshot.docs.forEach((doc) {
            doc.reference.delete();
          });
        });
      }
    }

    // Remove o amigo da coleção 'amigos' do usuário pelo nome
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('amigos')
        .where('nome', isEqualTo: nomeAmigo)
        .get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        doc.reference.delete();
      });
    });

    return true; // Amigo removido com sucesso
  } catch (e) {
    print('Erro ao remover amigo: $e');
    return false; // Retorna false em caso de erro
  }
}

  Future<bool> verificarUsuarioPorNome(String nomeUsuario) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
          .collection('users')
          .where('nome', isEqualTo: nomeUsuario)
          .get();

      // Se o snapshot contiver algum documento, significa que o usuário existe
      return querySnapshot.docs.isNotEmpty;
    } catch (e) {
      print('Erro ao verificar usuário por nome: $e');
      return false; // Retorna false em caso de erro
    }
  }


    Future<Map<String, dynamic>> listarAmigosPorId(String userId) async {
    try {
      QuerySnapshot<Map<String, dynamic>> amigosSnapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('amigos')
          .get();

      // Cria um mapa para armazenar os amigos
      Map<String, dynamic> amigosMap = {};

      // Itera sobre os documentos e os adiciona ao mapa
      for (var doc in amigosSnapshot.docs) {
        amigosMap[doc.id] = doc.data();
      }

      return amigosMap;
    } catch (e) {
      print('Erro ao listar amigos por ID: $e');
      return {}; // Retorna um mapa vazio em caso de erro
    }
  }
  
Future<bool> compartilharPlaylist(String userId, String playlistId, String nomeUsuarioAmigo) async {
  try {
    // Verifica se o usuário amigo existe
    bool usuarioAmigoExiste = await verificarUsuarioPorNome(nomeUsuarioAmigo);
    if (!usuarioAmigoExiste) {
      print('Usuário amigo não encontrado.');
      return false;
    }

    // Obtém o ID do usuário amigo
    String? idUsuarioAmigo = await AutenticacaoServico().buscarIDPorNome(nomeUsuarioAmigo);
    if (idUsuarioAmigo == null) {
      print('ID do usuário amigo não encontrado.');
      return false;
    }

    // Compartilha o ID da playlist do seu usuário com o usuário amigo na coleção 'compartilhadas'
    await _firestore
        .collection('compartilhadas')
        .doc(playlistId) // Usa o mesmo ID da playlist do usuário
        .set({
          'playlistId': playlistId, // Id da playlist do usuário que compartilha
          'sharedBy': userId, // Seu ID de usuário
          'sharedWith': idUsuarioAmigo, // ID do usuário amigo que recebe a playlist compartilhada
          // Outros detalhes da playlist, se necessário
        });

    return true; // Playlist compartilhada com sucesso
  } catch (e) {
    print('Erro ao compartilhar playlist: $e');
    return false; // Retorna false em caso de erro
  }
}
Future<Map<String, String>> obterPlaylistsCompartilhadas() async {
  try {
    Map<String, String> playlistsCompartilhadas = {};

    // Consulta a coleção 'compartilhadas' para obter todas as playlists compartilhadas
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
        .collection('compartilhadas')
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Itera sobre os documentos da coleção 'compartilhadas'
      for (var doc in querySnapshot.docs) {
        String playlistId = doc.id;
        String idAmigo = doc.data()?['sharedWith'] ?? '';

        playlistsCompartilhadas[playlistId] = idAmigo;
      }
    }

    return playlistsCompartilhadas;
  } catch (e) {
    print('Erro ao obter playlists compartilhadas: $e');
    return {}; // Retorna um mapa vazio em caso de erro
  }
}
Future<String?> obterIdAmigoPorPlaylist(String playlistId) async {
  try {
    String idAmigo = '';

    // Consulta a coleção 'compartilhadas' para encontrar o documento com o playlistId
    DocumentSnapshot<Map<String, dynamic>> snapshot = await _firestore
        .collection('compartilhadas')
        .doc(playlistId)
        .get();

    if (snapshot.exists) {
      // Se o documento existir, obtemos o ID do amigo
      idAmigo = snapshot.data()?['sharedWith'] ?? '';
    }

    return idAmigo.isNotEmpty ? idAmigo : null; // Retorna o ID do amigo ou null se não encontrado
  } catch (e) {
    print('Erro ao obter ID do amigo: $e');
    return null; // Retorna null em caso de erro
  }
}


Future<String?> obterNomePlaylistPorId(String idAmigo, String idPlaylist) async {
  try {
    DocumentSnapshot<Map<String, dynamic>> playlistSnapshot = await _firestore
        .collection('usuarios') // Suponha que os nomes das playlists estejam na coleção 'usuarios'
        .doc(idAmigo) // Documento correspondente ao amigo
        .collection('playlists') // Coleção de playlists do amigo
        .doc(idPlaylist) // Documento da playlist específica
        .get();

    if (playlistSnapshot.exists) {
      // Obtém o nome da playlist se ela existir
      return playlistSnapshot.data()?['nome'];
    } else {
      // Se a playlist não existir, retorna null ou uma mensagem de erro
      return null;
    }
  } catch (e) {
    print('Erro ao obter nome da playlist: $e');
    return null; // Retorna null em caso de erro
  }
}
Future<bool> enviarMensagem(String remetenteId, String destinatarioId, String mensagem) async {
  try {
    DocumentReference mensagemRef = _firestore.collection('mensagens').doc();
    await mensagemRef.set({
      'remetenteId': remetenteId,
      'destinatarioId': destinatarioId,
      'mensagem': mensagem,
      'respondido': false, // Define como não respondido inicialmente
      // Outros campos necessários para a mensagem
    });
    return true; // Mensagem enviada com sucesso
  } catch (e) {
    print('Erro ao enviar mensagem: $e');
    return false; // Erro ao enviar mensagem
  }
}




Future<bool> adicionarAmigo2(String userId, String nomeAmigo, String mensagem) async {
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
    bool mensagemEnviada = await enviarMensagem(userId, nomeAmigo, mensagem);
    if (!mensagemEnviada) {
      return false; // Se a mensagem não foi enviada com sucesso, retorna falso
    }

    // Aguardar pela resposta antes de adicionar o amigo
    final amigoID = AutenticacaoServico().buscarIDPorNome(nomeAmigo);
    bool resposta = await receberResposta(userId, amigoID as String);
    if (resposta) {
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


Future<bool> receberResposta(String remetenteId, String destinatarioId) async {
  try {
    QuerySnapshot<Map<String, dynamic>> respostaSnapshot = await _firestore
        .collection('mensagens')
        .where('remetenteId', isEqualTo: destinatarioId)
        .where('destinatarioId', isEqualTo: remetenteId)
        .where('respondido', isEqualTo: true)
        .get();

    if (respostaSnapshot.docs.isNotEmpty) {
      return true; // Resposta recebida e é verdadeira
    }
  } catch (e) {
    print('Erro ao receber resposta: $e');
  }
  return false; // Se não houver resposta verdadeira ou ocorrer um erro, retorna false
}
Future<void> enviarResposta(String remetenteId, String destinatarioId, bool resposta) async {
  try {
    QuerySnapshot<Map<String, dynamic>> mensagensSnapshot = await _firestore
        .collection('mensagens')
        .where('remetenteId', isEqualTo: destinatarioId)
        .where('destinatarioId', isEqualTo: remetenteId)
        .get();

    if (mensagensSnapshot.docs.isNotEmpty) {
      // Supondo que só haja uma mensagem correspondente, ou você pode iterar se houver várias
      final mensagemId = mensagensSnapshot.docs.first.id;

      await _firestore.collection('mensagens').doc(mensagemId).update({
        'respondido': true,
        'resposta': resposta,
      });
    }
  } catch (e) {
    print('Erro ao enviar resposta: $e');
  }
}


Future<List<Map<String, dynamic>>> listarMensagens(String destinatarioId) async {
  try {
    QuerySnapshot<Map<String, dynamic>> mensagensSnapshot = await _firestore
        .collection('mensagens')
        .where('destinatarioId', isEqualTo: destinatarioId)
        .get();

    List<Map<String, dynamic>> mensagens = [];

    for (var mensagem in mensagensSnapshot.docs) {
      mensagens.add({
        'remetenteId': mensagem['remetenteId'],
        'mensagem': mensagem['mensagem'],
        // Outros campos necessários
      });
    }

    return mensagens;
  } catch (e) {
    print('Erro ao listar mensagens: $e');
    return []; // Retorna uma lista vazia em caso de erro
  }
}

}
