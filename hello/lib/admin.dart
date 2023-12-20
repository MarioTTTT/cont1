import 'package:flutter/material.dart';
import 'package:hello/main.dart';

import 'package:hello/services/musics.dart';
class AdminMusicAddScreen extends StatefulWidget {
  const AdminMusicAddScreen({super.key});

  @override

  _AdminMusicAddScreenState createState() => _AdminMusicAddScreenState();
}

class _AdminMusicAddScreenState extends State<AdminMusicAddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _musicaService = MusicaService();

  late TextEditingController _nomeController;
  late TextEditingController _dataController;
  late TextEditingController _imageUrlController;
  late TextEditingController _bandaCantorController;
 late TextEditingController _audioUrlController;
  late TextEditingController _playlistIdController;

  @override
  void initState() {
    super.initState();
    _nomeController = TextEditingController();
    _dataController = TextEditingController();
    _imageUrlController = TextEditingController();
    _bandaCantorController = TextEditingController();
     _audioUrlController = TextEditingController();
    _playlistIdController = TextEditingController();
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _dataController.dispose();
    _imageUrlController.dispose();
    _bandaCantorController.dispose();
    _audioUrlController.dispose();
    _playlistIdController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final novaMusica = Musica(
        nome: _nomeController.text,
        dataLancamento: _dataController.text,
        imageUrl: _imageUrlController.text,
        bandaCantor: _bandaCantorController.text,
        audioUrl: _audioUrlController.text, 


      );

      await _musicaService.adicionarMusica(novaMusica);
      // Limpar os campos após adicionar a música
      _nomeController.clear();
      _dataController.clear();
      _imageUrlController.clear();
      _bandaCantorController.clear();
      _audioUrlController.clear();
   

      // Aqui você pode adicionar alguma mensagem de sucesso ou navegar para outra tela
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Música'),
      ),
      body: Padding(
        
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                
                TextFormField(
                  controller: _nomeController,
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira o nome da música';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _dataController,
                  decoration: InputDecoration(labelText: 'Data de Lançamento (yyyy-MM-dd)'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira a data de lançamento';
                    }
                    return null;
                  },
                ),

               TextFormField(
                  controller:_imageUrlController,
                  decoration: InputDecoration(labelText: 'imageURL'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, a URL';
                    }
                    return null;
                  },
                ),

           TextFormField(
                  controller: _bandaCantorController,
                  decoration: InputDecoration(labelText: 'Banda/Cantor'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, a Banda/Cantor';
                    }
                    return null;
                  },
                ),
           TextFormField(
                  controller:   _audioUrlController,
                  decoration: InputDecoration(labelText: 'AudioURL'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, a AudioURL';
                    }
                    return null;
                  },
                ),
                // Adicione os campos restantes para imageUrl, bandaCantor, audioUrl, playlistId, etc.
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Adicionar Música'),
                ),
                
              ],
            ),
          ),
        ),
      ),
        floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String? audioUrl = await musicStorageService.uploadAudio();
          // Faça algo com a URL do áudio, como salvá-la no banco de dados, etc.
          print('URL do áudio: $audioUrl');
        },
        child: const Icon(Icons.upload),
      ),
    );
  }
}