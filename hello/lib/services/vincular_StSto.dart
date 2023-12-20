import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreServico {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> associarDadosUsuarioFirestore(String nome, String email) async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
        // Crie um documento com o UID do usuário na coleção "users"
        DocumentReference userDocument = _firestore.collection('usuarios').doc(user.uid);

        // Associe informações adicionais ao documento do usuário
        await userDocument.set({
          'nome': nome,
          'email': email,
          // Adicione outros campos necessários para o usuário
        });
      }
    } catch (e) {
      print('Erro ao associar dados do usuário ao Firestore: $e');
    }
  }
}