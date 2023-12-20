import 'package:cloud_firestore/cloud_firestore.dart';

class Musica {
  final String nome;
  final String dataLancamento;
  final String imageUrl;
  final String bandaCantor;
  final String audioUrl;


  Musica({
    required this.nome,
    required this.dataLancamento,
    required this.imageUrl,
    required this.bandaCantor,
     required this.audioUrl,

  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'dataLancamento': dataLancamento,
      'imageUrl': imageUrl,
      'bandaCantor': bandaCantor,
      //'audioUrl': audioUrl,
 
    };
  }

  factory Musica.fromMap(Map<String, dynamic> map) {
    return Musica(
      nome: map['nome'],
      dataLancamento: (map['dataLancamento'] ),
      imageUrl: map['imageUrl'],
      bandaCantor: map['bandaCantor'],
      audioUrl: map['audioUrl'],

    );
  }
    factory Musica.fromFirestore(DocumentSnapshot doc) {
     Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Musica(
      nome: data['nome'] ?? '',
      dataLancamento: (data['dataLancamento']),
      imageUrl: data['imageUrl'] ?? '',
      bandaCantor: data['bandaCantor'] ?? '',
      audioUrl: data['audioUrl'],
    );
  }
}

class MusicaService {
  
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String collectionName = 'musicas'; // Nome da coleção de músicas no Firestore

  Future<void> adicionarMusica(Musica musica) async {
    try {
      await _firestore.collection(collectionName).add(musica.toMap());
    } catch (e) {
      print('Erro ao adicionar música: $e');
    }
  }

  Future<void> atualizarMusica(String musicaId, Musica musica) async {
    try {
      await _firestore.collection(collectionName).doc(musicaId).update(musica.toMap());
    } catch (e) {
      print('Erro ao atualizar música: $e');
    }
  }

  Future<void> deletarMusica(String musicaId) async {
    try {
      await _firestore.collection(collectionName).doc(musicaId).delete();
    } catch (e) {
      print('Erro ao deletar música: $e');
    }
  }

  Stream<List<Musica>> obterMusicasDaPlaylist(String playlistId) {
    return _firestore
        .collection(collectionName)
        .where('playlistId', isEqualTo: playlistId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => Musica.fromMap(doc.data())).toList());
  }
 Future<String?> buscarIdMusicaPorNome(String nomeMusica) async {
    try {
      final querySnapshot = await _firestore
          .collection(collectionName)
          .where('nome', isEqualTo: nomeMusica)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs.first.id;
      } else {
        return null;
      }
    } catch (e) {
      print('Erro ao buscar ID da música: $e');
      return null;
    }
  }
  
Future<Musica> getMusicaById(String musicaId) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Referência para a coleção 'musicas' no Firestore
  CollectionReference musicasCollection = firestore.collection('musicas');

  try {
    // Obtém um documento específico pelo ID fornecido
    DocumentSnapshot musicaSnapshot = await musicasCollection.doc(musicaId).get();

    if (musicaSnapshot.exists) {
      // Aqui você pode usar o DocumentSnapshot da música
      print('Dados da Música: ${musicaSnapshot.data()}');
      
      // Ou você pode criar uma instância da classe Musica usando o método fromFirestore
      Musica musica = Musica.fromFirestore(musicaSnapshot);
      print('Nome da Música: ${musica.nome}');
      print('Nome da Música: ${musica.imageUrl}');
      print('Nome da Música: ${musica.bandaCantor}');
      return musica; // Retorna a instância de Musica obtida
    } else {
      print('Documento não encontrado');
      return Musica(nome: '', imageUrl: '', dataLancamento: '', bandaCantor: '', audioUrl: ''); // Retorna uma instância vazia de Musica, por exemplo
    }
  } catch (e) {
    print('Erro ao obter documento: $e');
    throw Exception('Erro ao obter música: $e'); // Lança uma exceção em caso de erro
  }
}
Future<List<Musica>> listarTodasAsMusicas() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection(collectionName).get();

      List<Musica> musicas = querySnapshot.docs
          .map((doc) => Musica.fromFirestore(doc))
          .toList();

      return musicas;
    } catch (e) {
      print('Erro ao listar as músicas: $e');
      throw Exception('Erro ao listar as músicas: $e');
    }
  }

}