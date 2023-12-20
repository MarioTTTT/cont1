import 'package:flutter/material.dart';
import 'package:hello/colors/colors_theme.dart';
import 'package:hello/services/autentica_service.dart';
import 'package:hello/services/play_list.dart';

class PlaylistNameDialog extends StatefulWidget {
final Function(String) onSave;
  final VoidCallback? onUpdateScreen; // Função de atualização da tela

  const PlaylistNameDialog({Key? key, required this.onSave, this.onUpdateScreen}) : super(key: key);

  @override
  _PlaylistNameDialogState createState() => _PlaylistNameDialogState();
}

class _PlaylistNameDialogState extends State<PlaylistNameDialog> {
  final TextEditingController _nomeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isEmpty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 18, 46),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Insira o nome da playlist',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _nomeController,
                  decoration: InputDecoration(
                    hintText: 'Nome da playlist',
                    border: OutlineInputBorder(),
                    errorText: _isEmpty ? 'Por favor, insira um nome para a playlist' : null,
                  ),
                  textAlign: TextAlign.center,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      setState(() {
                        _isEmpty = true;
                      });
                      return 'Campo obrigatório';
                    }
                    setState(() {
                      _isEmpty = false;
                    });
                    return null;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
              onPressed: () async {
      if (_formKey.currentState!.validate()) {
        final String playlistName = _nomeController.text;
        final List<String> musicas = []; // Defina a lista de músicas (se necessário)

        final userId = AutenticacaoServico().getUidUsuarioAtual();
        if (userId != null) {
          bool existe = await PlaylistService().criarPlaylist(userId, playlistName, musicas);
         showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                        backgroundColor: AppColors.primaryColor,
                      title: Text(
                        existe ? 'Não foi possível criar' : 'Sucesso',
                        style: TextStyle(color: Colors.white), // Cor do título
                      ),
                      content: Text(
                        existe ? 'Essa Playlist já existe' : 'A Playlist foi criada',
                        style: TextStyle(color: Colors.white), // Cor do conteúdo
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            if (!existe && widget.onUpdateScreen != null) {
                              widget.onSave(playlistName);
                              widget.onUpdateScreen!(); // Chama a função de atualização da tela
                            }
                          },
                          child: Text(
                            'OK',
                            style: TextStyle(color: Colors.white), // Cor do texto do botão
                          ),
                        ),
                      ],
                    ),
                  );
        }
      }
    },
    child: Text('Salvar',style: TextStyle(color: Colors.white),),
    style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondaryColor),
       
  ),
 
              ],
            ),
          ),
        ),
      ),
    );
  }
}
