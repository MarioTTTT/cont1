import 'package:flutter/material.dart';
import 'package:hello/colors/colors_theme.dart';
import 'package:hello/inicial.dart';
import 'package:hello/playlist_perfil.dart';
import 'package:hello/services/autentica_service.dart';
import 'package:hello/services/play_list.dart';
import 'package:hello/widgets/perfil_lists.dart';
import 'package:hello/widgets/play_listinsert.dart';

import 'friend_screen.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({Key? key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  final TextEditingController _nomeController = TextEditingController();
  String nome = '';

  @override
  void initState() {
    super.initState();
    _carregarNomeUsuario();
  }

  Future<void> _carregarNomeUsuario() async {
    final nomeUsuario = await AutenticacaoServico().obterNomeUsuarioAtual();
    setState(() {
      nome = nomeUsuario ?? 'Nome Padrão';
    });
    
  }

void _showPlaylistNameDialog(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return PlaylistNameDialog(
        onSave: (String playlistName) {
          print('Nome da playlist: $playlistName');
        },
        onUpdateScreen: _atualizarListadePlaylists, // Passa a função de atualização da tela
      );
    },
  );
}
  Future<void> _atualizarListadePlaylists() async {
    setState(() {}); // Atualiza o estado para refletir as alterações
  }
  @override
  Widget build(BuildContext context) {
    final userId = AutenticacaoServico().getUidUsuarioAtual();

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 36, 72, 141),
        title: const Text('ColdMusic'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Inicial()),
            );
            
          },
          
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            child: const CircleAvatar(
                              radius: 60,
                              backgroundImage: AssetImage('assets/images/peguim.png'),
                            ),
                          ),
                        ),
                        Text(
                          nome,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
             
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.group_rounded,
                    size: 20,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const FriendScreen()));
                  },
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: const Text(
                        'PlayLists',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add_circle_outline,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        _showPlaylistNameDialog(context);
                        
                      },
                    ),
                  ],
                ),
                // Defina a lista de músicas (se necessário)
            
                  FutureBuilder<List<String>>(
                    future: PlaylistService().obterNomesPlaylistsUsuario(userId!),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Erro: ${snapshot.error}');
                      } else {
                        final playlists = snapshot.data ?? [];
                        return Column(
                          children: playlists.map((playlist) {
                            return PerfilList(labelText: playlist, proximaTela: PlayPerfil(labelText: playlist) , onUpdateScreen: _atualizarListadePlaylists,);
                            
                          }).toList(),
                        );
                      }
                    },
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}