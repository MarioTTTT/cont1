import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> verificarEmailEmUso(String email) async {
    try {
      // Use o método fetchSignInMethodsForEmail para verificar se o e-mail já está em uso
      var methods = await _auth.fetchSignInMethodsForEmail(email);

      // Se methods não estiver vazio, isso significa que o e-mail está em uso
      if (methods.isNotEmpty) {
        return true; // E-mail está em uso
      } else {
        return false; // E-mail não está em uso
      }
    } catch (e) {
      // Se ocorrer algum erro, trate de acordo com o seu fluxo de aplicativo
      print("Erro ao verificar e-mail em uso: $e");
      return false; // Retorna false por padrão em caso de erro
    }
  }

  // Restante do seu código para cadastro de usuário e outras funcionalidades
}