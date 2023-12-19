import 'package:flutter/material.dart';
import 'package:hello/colors/colors_theme.dart';
import 'package:hello/playmusic.dart';
import 'package:hello/services/musics.dart';
import 'package:hello/widgets/model_Music.dart';
 // Importe o arquivo onde está definido MusicaService

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<MusicModel> displaylist = [];

  // Instância de MusicaService
  final MusicaService musicaService = MusicaService();

  @override
  void initState() {
    super.initState();
    _loadMusicas(); // Chama a função para carregar as músicas
  }

  Future<void> _loadMusicas() async {
    try {
      // Chama a função listarTodasAsMusicas para obter todas as músicas
      List<Musica> musicas = await musicaService.listarTodasAsMusicas();

      // Converte a lista de Musica para MusicModel
      setState(() {
        displaylist = musicas
            .map((musica) => MusicModel(
                  musica.nome,
                  int.parse(musica.dataLancamento),
                  musica.imageUrl,
                  musica.bandaCantor,
                  musica.audioUrl,
                ))
            .toList();
      });
    } catch (e) {
      print('Erro ao carregar músicas: $e');
      // Trate o erro conforme necessário
    }
  }
void updateList(String value) {
  setState(() {
    if (value.isEmpty) {
      // Se a caixa de pesquisa estiver vazia, exiba a lista completa
      _loadMusicas();
    } else {
      // Caso contrário, filtre a lista com base no valor da pesquisa
      displaylist = displaylist
          .where((element) =>
              element.musicatitulo!
                  .toLowerCase()
                  .contains(value.toLowerCase()))
          .toList();
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pesquise por uma Música',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.0),
          TextField(
            onChanged: (value) => updateList(value),
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.secondaryColor,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              hintText: "ex:Yourself",
              prefixIcon: Icon(Icons.search),
              prefixIconColor: Colors.white,
            ),
          ),
          SizedBox(height: 20.0),
          Expanded(
            child: displaylist.length == 0
                ? Center(
                    child: Text(
                      "Resultados não encontrados",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: displaylist.length,
                    itemBuilder: (context, index) => ListTile(
                      contentPadding: EdgeInsets.all(8.0),
                      title: Text(
                        displaylist[index].musicatitulo!,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        '${displaylist[index].banda}',
                        style: TextStyle(color: Colors.white),
                      ),
                      trailing: Text(
                        "${displaylist[index].musicaano}",
                        style: TextStyle(color: Colors.white),
                      ),
                      leading: GestureDetector(
                      onTap: () {
                          // Adicione aqui a navegação para a outra tela
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MusicTocar(
                              musicaData: Musica(
                                // Passe os parâmetros necessários
                                nome: displaylist[index].musicatitulo!,
                                dataLancamento:
                                    displaylist[index].musicaano.toString(),
                                imageUrl: displaylist[index].musicaimagem!,
                                bandaCantor: displaylist[index].banda!,
                                audioUrl: displaylist[index].musicaurl!,
                              ),
                            ),
                          ));
                        },
                        child: Image.network(displaylist[index].musicaimagem!),
            )
                      
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
