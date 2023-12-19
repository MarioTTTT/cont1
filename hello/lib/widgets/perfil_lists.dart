import 'package:flutter/material.dart';
import 'package:hello/services/autentica_service.dart';
import 'package:hello/services/play_list.dart';
import '../colors/colors_theme.dart';

class PerfilList extends StatefulWidget {
  final String labelText;
  final Widget proximaTela;
  final VoidCallback? onUpdateScreen;

  const PerfilList({
    Key? key,
    required this.proximaTela,
    required this.labelText,
    this.onUpdateScreen,
  }) : super(key: key);

  @override
  State<PerfilList> createState() => _PerfilList_State();
}

class _PerfilList_State extends State<PerfilList> {
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

Future<void> _deletePlaylistAndUpdate() async {
    if (userId != null) {
      await PlaylistService().deletarPlaylistPorNome(userId!, widget.labelText);
      _updateUserId(); // Atualiza o estado após a exclusão da playlist
      if (widget.onUpdateScreen != null) {
        widget.onUpdateScreen!(); // Chama a função de atualização da tela
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return widget.proximaTela;
              }));
            },
            child: Container(
              padding: const EdgeInsets.all(5.0),
              child: Image(
                height: 100,
                width: 100,
                image: AssetImage('assets/images/Playholder.png'),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: SizedBox(
              width: 90,
              height: 30,
              child: Text(
                widget.labelText,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            child: IconButton(
              icon: Icon(
                Icons.cancel_presentation_outlined,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () async {
                if (userId != null) {
                
                  showDialog(
                    
                    context: context,
                    builder: (_) => AlertDialog(
                        backgroundColor: AppColors.primaryColor,
                      title: Text('Sucesso', style: TextStyle(color: Colors.white)),
                      
                      content: Text('A Playlist foi deletada', style: TextStyle(color: Colors.white)),
                      
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);

                             _deletePlaylistAndUpdate();
                          },
                          child: Text('OK', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
         
        ],
      ),
    );
  }
}
