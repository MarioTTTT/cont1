import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:hello/colors/colors_theme.dart';
import 'package:hello/services/autentica_service.dart';
import 'package:hello/services/friends.dart';
import 'package:hello/shares.dart';
import 'package:hello/widgets/scroll_down.dart';



class FriendScreen extends StatefulWidget {
  const FriendScreen({super.key});

  @override
  State<FriendScreen> createState() => _FriendScreenState();
}

 Future<Map<int, Map<String, dynamic>>> obterDadosAmigosParaMapa(String userId) async {
  
  final AmigosService amigosService = AmigosService();
    try {
      // Aqui você pode chamar a função para listar os amigos do usuário por ID
      Map<String, dynamic> amigos = await amigosService.listarAmigosPorId(userId);

      // Mapa para armazenar os dados formatados para 'data'
      Map<int, Map<String, dynamic>> dadosAmigos = {};

      // Itera sobre os amigos e os adiciona ao mapa 'data'
      int index = 1;
      amigos.forEach((id, amigoData) {
        dadosAmigos[index] = {
          'image': '', // Adicione a URL da imagem do amigo, se disponível
          'text': amigoData['nome'], // Nome do amigo
          'proximaTela': ShareScreen(), // Pode ser o mesmo para todos
        };
        index++;
      });

      return dadosAmigos;
    } catch (e) {
      print('Erro ao obter dados dos amigos para o mapa: $e');
      return {}; // Retorna um mapa vazio em caso de erro
    }
  }


class _FriendScreenState extends State<FriendScreen> {
   final AutenticacaoServico _firebaseAuth = AutenticacaoServico();
  final AmigosService amigosService = AmigosService();
       
        
 
  String newFriendName = '';

Future<void> _atualizarListadePlaylists() async {
    setState(() {}); // Atualiza o estado para refletir as alterações
  }
Future<bool> adicionarAmigoSeExistir() async {
  final userId = _firebaseAuth.getUidUsuarioAtual();
  final usuarioExiste = await amigosService.verificarUsuarioPorNome(newFriendName);

  if (usuarioExiste) {
    bool amigoAdicionado = await amigosService.adicionarAmigo(userId!, newFriendName);
    if (amigoAdicionado==true) {
       if (mounted) {
  setState(() {
    // Atualiza o estado apenas se o widget estiver montado na árvore de widgets
    // Faça a atualização necessária aqui
  });
}
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: AppColors.primaryColor,
          title: Text('Amigo adicionado',style: TextStyle(color: Colors.white)),
          content: Text('Ele foi adicionado à sua lista de amigos',style: TextStyle(color: Colors.white)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK',style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      );

      return true;
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          backgroundColor: AppColors.primaryColor,
          title: Text('Amigo já existe',style: TextStyle(color: Colors.white)),
          content: Text('Nome invalido',style: TextStyle(color: Colors.white)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK',style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      );
      return false;
    }
  } else {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: AppColors.primaryColor,
        title: Text('Amigo não encontrado',style: TextStyle(color: Colors.white)),
        content: Text('Pessoa não encontrada. Este usuário não existe.',style: TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('OK',style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
    return false;
  }
}

  @override
  Widget build(BuildContext context) {


    
    return Scaffold(

       backgroundColor:AppColors.primaryColor,
         appBar: AppBar(
       backgroundColor: const Color.fromARGB(255,36, 72, 141),
      
       title: const Text('ColdMusic'),
           
         
                                                
       
      ),
   body:SingleChildScrollView(
   
   scrollDirection: Axis.vertical,

    child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Text(
                                  
                                 'Amigos',
                                      style: TextStyle(
                                  fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                 ),
                                   
                               ),
                               
                    ),
                        
                                            IconButton(
                                                     icon: Icon(
                                                     Icons.add,
                                                      size: 25,
                                                      color: Colors.white,
                                                                                       ), 
                                                      onPressed: () { 

                                                           showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        backgroundColor: AppColors.primaryColor,
                        title: Text('Adicionar amigo'),
                        content: TextFormField(
                          decoration: InputDecoration(hintText: 'Digite o nome do amigo'),
                          onChanged: (value) {
                            setState(() {
                              newFriendName = value;
                            });
                          },
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text('Cancelar',style: TextStyle(color: Colors.white)),
                          ),
                     ElevatedButton(
                     style: ElevatedButton.styleFrom(backgroundColor: AppColors.primaryColor),
                       onPressed: () async {
                          bool adicionar = await adicionarAmigoSeExistir();
                             if (adicionar) {
                                   Navigator.pop(context); // Fechar o AlertDialog se adicionar for verdadeiro
                                 }
                                 },
                          child: Text('Adicionar',style: TextStyle(color: Colors.white)),
                          ),


                        ],
                      ),
                    );
                                                       },
                                                   ),
                                                





                  ],
                ),
        FutureBuilder<Map<int, Map<String, dynamic>>>(
              future: obterDadosAmigosParaMapa(_firebaseAuth.getUidUsuarioAtual() as String),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return Column(
                    children: snapshot.data!.entries
                        .map(
                          (entry) => PlayCard(
                            image: entry.value['image']!,
                            labelText: entry.value['text']!,
                            proximaTela: entry.value['proximaTela'],
                            onUpdateScreen: _atualizarListadePlaylists
                          ),
                        )
                        .toList(),
                  );
                } else {
                  return Text('Nenhum amigo encontrado.');
                }
              },
            ),
              ],
              
            ),
  ),
   


    );
  }

}