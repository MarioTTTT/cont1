import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AutenticacaoServico  {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<String?> cadastrarUsuario({
    required String nome,
    required String email,
    required String senha})async{
     try {
  UserCredential userCredential = 
  await _firebaseAuth.createUserWithEmailAndPassword(
   email: email,
    password: senha);
  await userCredential.user!.updateDisplayName(nome);
await associarDadosUsuarioFirestore(nome, email);
  return null;
  
} on FirebaseAuthException catch (e) {
  print(e.code);
 if(e.code =="email-already-in-use" ){
      return "O Usuario ja esta cadastrado";
         
 }
    return "Erro desconhecido";
}
  }
    
 Future <String?> LogarUser({required String email, required String senha}) async{
   try {
  await _firebaseAuth.signInWithEmailAndPassword(email: email, password: senha);
  return null;
} on FirebaseAuthException catch (e) {

  return e.message;
}
 }

 Future <void> deslogar() async{
  return _firebaseAuth.signOut();
 }
  Future<User?> buscarUsuarioPorEmail(String email) async {
    try {
      User? user = (await _firebaseAuth.fetchSignInMethodsForEmail(email)).isEmpty
          ? null
          : _firebaseAuth.currentUser;
      return user;
    } on FirebaseAuthException catch (e) {
      print("Erro ao buscar usuário por e-mail: ${e.message}");
      return null;
    }
  }
    Future<User?> buscarUsuarioPorNome(String nome) async {
    try {
      User? user = (await _firebaseAuth.fetchSignInMethodsForEmail(nome)).isEmpty
          ? null
          : _firebaseAuth.currentUser;
      return user;
    } on FirebaseAuthException catch (e) {
      print("Erro ao buscar usuário por e-mail: ${e.message}");
      return null;
    }
  }
  Future<String?> buscarIDPorNome(String nome) async {
  try {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('nome', isEqualTo: nome)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // Se existir algum usuário com esse nome, retorna o ID do primeiro documento encontrado
      return querySnapshot.docs.first.id;
    } else {
      // Caso não encontre nenhum usuário com esse nome
      return null;
    }
  } catch (e) {
    print("Erro ao buscar usuário por nome: $e");
    return null;
  }
}
Future<void> associarDadosUsuarioFirestore(String nome, String email) async {
    try {
      User? user = _firebaseAuth.currentUser;
      if (user != null) {
      
        DocumentReference userDocument = _firestore.collection('users').doc(user.uid);

   
        await userDocument.set({
          'nome': nome,
          'email': email,
          
        });
      }
    } catch (e) {
      print('Erro ao associar dados do usuário ao Firestore: $e');
    }
  }
 
   String? getUidUsuarioAtual() {
    return _firebaseAuth.currentUser?.uid;
  }

Future<String?> obterNomeUsuarioAtual() async {
  try {
    String? uid = getUidUsuarioAtual();
    if (uid != null) {
      DocumentSnapshot userSnapshot =
          await _firestore.collection('users').doc(uid).get();

      if (userSnapshot.exists) {
        Map<String, dynamic> userData = userSnapshot.data() as Map<String, dynamic>;
        return userData['nome'] as String?;
      } else {
        return null; 
      }
    } else {
      return null; 
    }
  } catch (e) {
    print('Erro ao obter o nome do usuário: $e');
    return null;
  }
}

}