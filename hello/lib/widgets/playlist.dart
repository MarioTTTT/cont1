import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hello/playmusic.dart';
import 'package:hello/services/autentica_service.dart';
import 'package:hello/services/musics.dart';
import 'package:hello/services/play_list.dart';

import '../colors/colors_theme.dart';

class PlayCard extends StatefulWidget {

   final Musica musicaData;
  final Widget? proximaTela;
  final VoidCallback? onUpdateScreen;
  final String playlistnome;

  const PlayCard({Key? key, 
  required this.musicaData,
   required this.playlistnome,
    this.proximaTela,
    this.onUpdateScreen,
   
  }) : super(key: key);

  @override
  State<PlayCard> createState() => _PlayCardState();
}
  
class _PlayCardState extends State<PlayCard> {
  

  String? userId;

  @override
  void initState() {
    super.initState();
    _updateUserId();
  }

  Future<void> _updateUserId() async {
    final user = AutenticacaoServico().getUidUsuarioAtual();
    setState(() {
      userId = user;
    });
  }


  Future<void> _deleteMusicAndUpdate() async {
      
    if (userId != null) {
        print('Música deletada');
      final playId = await PlaylistService().obterIdPlaylistPorNome(userId!, widget.playlistnome);
      final musicId = await MusicaService().buscarIdMusicaPorNome(widget.musicaData.nome);
      await PlaylistService().removerMusicaDaPlaylist(userId!,playId!,musicId!);
         _updateUserId(); 
      // Após remover a música da playlist com sucesso, atualize o estado
      setState(() {
        userId = userId; // Isso pode ser ajustado conforme necessário
      });

      if (widget.onUpdateScreen != null) {
        widget.onUpdateScreen!(); // Chama a função de atualização da tela
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 36, 72, 141),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MusicTocar(musicaData: widget.musicaData),
      ),
    );
  },
  child: CircleAvatar(
    radius: 45,
    backgroundImage: NetworkImage(widget.musicaData.imageUrl),
  ),
),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.musicaData.nome,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    widget.musicaData.bandaCantor,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textun,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.cancel_presentation_outlined,
                size: 30,
                color: Colors.white,
              ),
             onPressed: () async {
                if (userId != null) {
                 print('Música deletada');
                  showDialog(
                    
                    context: context,
                    builder: (_) => AlertDialog(
                       backgroundColor: AppColors.primaryColor,
                      title: Text('Sucesso',style: TextStyle(color: Colors.white)),
                      content: Text(' Música deletada',style: TextStyle(color: Colors.white)),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);

                             _deleteMusicAndUpdate();
                               print('Música deletada');
                          },
                          child: Text('OK',style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}