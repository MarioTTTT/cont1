import 'package:flutter/material.dart';
import 'package:hello/colors/colors_theme.dart';
import 'package:hello/services/autentica_service.dart';
import 'package:hello/services/friends.dart';
import 'package:hello/services/musics.dart';
import 'package:hello/services/play_list.dart';
import 'package:hello/widgets/playlist.dart';

import 'package:hello/colors/colors_theme.dart';
import 'package:hello/widgets/playlist.dart';

class PlayPerfil extends StatefulWidget {
    final String labelText;


  const PlayPerfil({
    Key? key,
    required this.labelText,
  }) : super(key: key);


  @override
  _PlayPerfilState createState() => _PlayPerfilState();
}

class _PlayPerfilState extends State<PlayPerfil> {
  TextEditingController _searchController = TextEditingController();
  final MusicaService _busca =MusicaService();
  final PlaylistService _playlista_add = PlaylistService();
  AutenticacaoServico _autenService = AutenticacaoServico();
  MusicaService _musicaService = MusicaService();
  String? searchedMusic;
  String? nomeUsuarioAmigo;


Future<void> _atualizarListadePlaylists() async {
    setState(() {}); // Atualiza o estado para refletir as alterações
  }
  void _addToPlaylist() {
    
    showModalBottomSheet(
      backgroundColor: AppColors.primaryColor,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Buscar música...',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    searchedMusic = _searchController.text.trim();
                  });
                  // Aqui você pode adicionar a lógica para adicionar searchedMusic à playlist
                   var musica = await _busca.buscarIdMusicaPorNome(searchedMusic!);
                  final userId = _autenService.getUidUsuarioAtual();
                 final playId = await PlaylistService().obterIdPlaylistPorNome(userId!, widget.labelText);
                    if (musica != null && userId != null && playId != null) {
                       bool existe = await _playlista_add.adicionarMusicaPlaylist(userId, playId,musica);
                       print('Adicionando $searchedMusic à playlist...');
                       if(existe==true){
                        
                        showDialog(
                                 context: context,
                           builder: (_) => AlertDialog(
                            backgroundColor: AppColors.primaryColor,
                               title: Text('Não foi possivel adicionar',style: TextStyle(color: Colors.white)),
                             content: Text('Essa música ja se encontra na playlist',style: TextStyle(color: Colors.white)),
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
                       }else{
                         setState(() {});
                        showDialog(
                                 context: context,
                           builder: (_) => AlertDialog(
                            backgroundColor: AppColors.primaryColor,
                               title: Text('PlayList Atualizada',style: TextStyle(color: Colors.white)),
                             content: Text('Musica adicionada com sucesso!',style: TextStyle(color: Colors.white)),
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
                       }
                       
                  }else{
                     print('Erro');

                  }
                  // Exemplo: playlistService.adicionarMusica(searchedMusic);
           
                 // Fecha o modal
                },
                child: Text('Adicionar à Playlist',style: TextStyle(color: Colors.white),),
      
    style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondaryColor),
              ),
            ],
          ),
        );
      },
    );
  }
void _sharedPlaylist() {
  showModalBottomSheet(
     backgroundColor: AppColors.primaryColor,
    context: context,
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar usuário para compartilhar',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  nomeUsuarioAmigo = _searchController.text.trim();
                });

                final userId = _autenService.getUidUsuarioAtual();
                final playId = await PlaylistService().obterIdPlaylistPorNome(userId!, widget.labelText);
                if (playId != null && userId != null && nomeUsuarioAmigo != null) {
                  bool playShare = await AmigosService().compartilharPlaylist(userId, playId, nomeUsuarioAmigo!);

                  if (playShare) {
                    setState(() {});
                    showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                        backgroundColor: AppColors.primaryColor,
                        title: Text('Playlist Compartilhada',style: TextStyle(color: Colors.white)),
                        content: Text('Playlist compartilhada com sucesso!',style: TextStyle(color: Colors.white)),
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
                  } else {
                    print('Erro ao compartilhar playlist');
                  }
                } else {
                  print('Erro ao obter ID da playlist ou usuário.');
                }
              },
              child: Text('Compartilhar Playlist',style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondaryColor),
            ),
          ],
        ),
      );
    },
  );
}

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 36, 72, 141),
        title: const Text('ColdMusic'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: 
        
         SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      widget.labelText?? 'Nome Padrão',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.share_rounded,
                      size: 25,
                      color: Colors.white,
                    ),
                    onPressed: _sharedPlaylist,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 25,
                      color: Colors.white,
                    ),
                    onPressed: _addToPlaylist,
                    
                  ),
                  
                ],
              ),
              // Restante do conteúdo...
             
          
      
 FutureBuilder<List<String>>(
      future: _getPlaylistMusicIds(),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Erro: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('Nenhuma música encontrada na playlist!');
        } else {
          return FutureBuilder<List<Musica>>(
            future: _getMusicasFromIds(snapshot.data!),
            builder: (BuildContext context, AsyncSnapshot<List<Musica>> musicaSnapshot) {
              if (musicaSnapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (musicaSnapshot.hasError) {
                return Text('Erro ao carregar música: ${musicaSnapshot.error}');
              } else if (!musicaSnapshot.hasData || musicaSnapshot.data!.isEmpty) {
                return Text('Nenhuma informação de música encontrada!');
              } else {
                return Column(
                  children: musicaSnapshot.data!.map((musica) {
                    return PlayCard(
                      musicaData: musica,playlistnome: widget.labelText,onUpdateScreen: _atualizarListadePlaylists
                    );
                  }).toList(),
                );
              }
            },
          );
        }
      },
    ),
  
    
        
            ],
          ),
        ),
     
    );
  }
 Future<List<Musica>> _getMusicasFromIds(List<String> musicIds) async {
  List<Musica> musicas = [];
  for (var id in musicIds) {
    Musica musica = await _musicaService.getMusicaById(id);
    musicas.add(musica);
  }
  return musicas;
}
  Future<List<String>> _getPlaylistMusicIds() async {
  final userId = _autenService.getUidUsuarioAtual();
  final playlistId = await PlaylistService().obterIdPlaylistPorNome(userId!, widget.labelText);
  final musicIds = await PlaylistService().listarIdsMusicasDaPlaylist(userId, playlistId!);
  return musicIds;
}

}
