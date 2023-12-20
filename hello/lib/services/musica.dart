// import 'package:cloud_firestore/cloud_firestore.dart';

// class Musica {
//   final String nome;
//   final DateTime dataLancamento;
//   final String urlImagem;
//   final String nomeBandaArtista;

//   Musica({
//     required this.nome,
//     required this.dataLancamento,
//     required this.urlImagem,
//     required this.nomeBandaArtista,
//   });

//   // Método para converter dados do Firebase em uma instância de Musica
//   factory Musica.fromFirestore(DocumentSnapshot doc) {
//     Map data = doc.data() as Map<String, dynamic>;
//     return Musica(
//       nome: data['nome'] ?? '',
//       dataLancamento: (data['dataLancamento']),
//       urlImagem: data['urlImagem'] ?? '',
//       nomeBandaArtista: data['nomeBandaArtista'] ?? '',
//     );
//   }
// }

// class Playlist {
//   final String nome;
//   final List<String> musicasIds;

//   Playlist({
//     required this.nome,
//     required this.musicasIds,
//   });

//   // Método para converter dados do Firebase em uma instância de Playlist
//   factory Playlist.fromFirestore(DocumentSnapshot doc) {
//     Map data = doc.data() as Map<String, dynamic>;
//     return Playlist(
//       nome: data['nome'] ?? '',
//       musicasIds: List<String>.from(data['musicas'] ?? []),
//     );
//   }
// }

// // Exemplo de como adicionar uma música ao Firestore
// Future<void> adicionarMusica(Musica musica) async {
//   CollectionReference musicas = FirebaseFirestore.instance.collection('musicas');
//   await musicas.add({
//     'nome': musica.nome,
//     'dataLancamento': musica.dataLancamento,
//     'urlImagem': musica.urlImagem,
//     'nomeBandaArtista': musica.nomeBandaArtista,
//   });
// }

// // Exemplo de como adicionar uma playlist ao Firestore
// Future<void> adicionarPlaylist(Playlist playlist) async {
//   CollectionReference playlists = FirebaseFirestore.instance.collection('playlists');
//   await playlists.add({
//     'nome': playlist.nome,
//     'musicas': playlist.musicasIds,
//   });
// }




// import 'package:flutter/material.dart';
// import 'package:hello/colors/colors_theme.dart';
// import 'package:hello/widgets/model_Music.dart';

// class SearchScreen extends StatefulWidget {
//   const SearchScreen({Key? key}) : super(key: key);

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   static List<MusicModel> mainmusiclist = [
//     MusicModel('Yourself', 2005,
//         "https://static.stereogum.com/uploads/2022/10/Eminem-Lose-Yourself-1666109360-520x5201-1666540295.jpeg",
//         'Eminem'),
//     MusicModel('bring me to life', 2003,
//         "https://akamai.sscdn.co/uploadfile/letras/albuns/c/e/0/6/874991585597114.jpg",
//         'Evanesce'),
//     MusicModel('In The End', 2000,
//         "https://i1.sndcdn.com/artworks-000386461686-h1f08n-t500x500.jpg",
//         'LinkPark'),
//     MusicModel('Psychosocial', 2008,
//         "https://wikimetalstore.com.br/produtos/imagens/229_1.jpg", 'SleepKnot'),
//   ];

//   List<MusicModel> displaylist = List.from(mainmusiclist);

//   void updateList(String value) {
//     setState(() {
//       displaylist = mainmusiclist
//           .where((element) => element.musicatitulo!.toLowerCase().contains(value.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.all(10),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Pesquise por uma Música',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 22.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           SizedBox(height: 20.0),
//           TextField(
//             onChanged: (value) => updateList(value),
//             style: TextStyle(color: Colors.white),
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: AppColors.secondaryColor,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 borderSide: BorderSide.none,
//               ),
//               hintText: "ex:Yourself",
//               prefixIcon: Icon(Icons.search),
//               prefixIconColor: Colors.white,
//             ),
//           ),
//           SizedBox(height: 20.0),
//           Expanded(
//             child: displaylist.length == 0
//                 ? Center(
//                     child: Text(
//                       "Resultados não encontrados",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   )
//                 : ListView.builder(
//                     itemCount: displaylist.length,
//                     itemBuilder: (context, index) => ListTile(
//                       contentPadding: EdgeInsets.all(8.0),
//                       title: Text(
//                         displaylist[index].musicatitulo!,
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       subtitle: Text(
//                         '${displaylist[index].banda}',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       trailing: Text(
//                         "${displaylist[index].musicaano}",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       leading: Image.network(displaylist[index].musicaimagem!),
//                     ),
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:audioplayers/audioplayers.dart';
// import 'package:flutter/material.dart';
// import 'package:hello/colors/colors_theme.dart';
// import 'package:hello/inicial.dart';
// import 'package:hello/widgets/util/format.dart';

// import 'widgets/music_info.dart';

// class MusicTocar extends StatefulWidget {
//   const MusicTocar({super.key});

//   @override
//   State<MusicTocar> createState() => _MusicTocarState();
// }

// class _MusicTocarState extends State<MusicTocar> {
//   bool isPlaying = false;
//    double volume = 1.0;
//   late final AudioPlayer player;
//   late final AssetSource path;

//   Duration _duracao = const  Duration();
//   Duration _posicao = const Duration();

//  @override
//  void initState(){
//     initPlayer();
//     super.initState();
//  }
  
//  @override
//  void dispose(){
//     player.dispose();
//     super.dispose();
//  }


//  Future initPlayer () async {
//   player = AudioPlayer();
//   path = AssetSource('audios/Eminem.mp3');

//   player.onDurationChanged.listen((Duration d) {
//     print(d);
//       setState(() => _duracao = d);
//     });
//    player.onPositionChanged.listen((Duration p){
    
//     setState(() => _posicao= p);
       
       
//        }
         
//   );
// player.onPlayerComplete.listen((_) {
//   setState(() {
//     _posicao = _duracao;
//   });
// });

   
//  }

//    Future playPause() async {
   
//      if(isPlaying){
//       player.pause();
//       isPlaying=false; 
//     }else{
//     player.play(path);
//     isPlaying= true;
//     }


   
//     setState(() { });
//   }
//    Future<void> setVolume(double vol) async {
//     await player.setVolume(vol);
//     setState(() {
//       volume = vol;
//     });
//   }

 
//   @override
//   Widget build(BuildContext context) {
   
//     return Scaffold(
//        appBar: AppBar(
//        backgroundColor:  AppColors.primaryColor,
      


//        leading: IconButton(
//                                           icon: const Icon(
//                                            Icons.arrow_back,
//                                             size: 30,
//                                             color: Colors.white,
//                                                                             ), 
                                                                            
//                                           onPressed: () {  Navigator.of(context).pop();
                                          
//                         },
//                                         ),
       
//       ),
//         backgroundColor: AppColors.primaryColor,


//         body: 
        
//        SingleChildScrollView(
//         scrollDirection:Axis.vertical,
//           child: Column(
//             children: [
//               Padding(padding: const EdgeInsets.all(18.0),
              
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                     const MusicInfo(),
//                     const SizedBox(height: 50,),
//                     Slider(
//                       value:_posicao.inSeconds.toDouble(),
                   
                    
//                     onChanged: (value) async{
//                       await player.seek(Duration(seconds: value.toInt()));
//                        setState(() { } );
                       
//                     },
//                      min:0,
//                     max: _duracao.inSeconds.toDouble(),
//                     inactiveColor:Colors.grey,
//                     activeColor:AppColors.secondaryColor,
                    
//                     ),
//                     Row(
//                       mainAxisAlignment:MainAxisAlignment.end,
//                       children: [
                    
//                            Text(_posicao.format()),
              
              
//                     ],),
//                     SizedBox(height: 30,),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                        InkWell(
//                           onTap: (){
//                             player.seek(Duration(seconds: _posicao.inSeconds-10));
//                             setState(() {});
//                           },
//                           child: Image.asset('assets/icons/end.png'),
//                        ),
//                       const SizedBox(width: 20,),
//                         InkWell(
//                              onTap: playPause,
//                             child:Icon(
//                             isPlaying ? Icons.pause_circle :Icons.play_circle,
//                             color :Colors.white,
//                            size: 100,
//                              ),
//                            ),
              
//                   const SizedBox(width: 20,),
//                     InkWell(
//                           onTap: (){
//                             player.seek(Duration(seconds: _posicao.inSeconds+10));
//                             setState(() {});
//                           },
//                           child: Image.asset('assets/icons/back.png'),
//                        )
//                     ],),
              
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           setVolume(volume - 0.1 > 0.0 ? volume - 0.1 : 0.0);
//                         },
//                         icon: Icon(Icons.volume_down),
//                       ),
//                       Slider(
//                         value: volume,
//                         onChanged: (value) {
//                           setVolume(value);
//                         },
//                         min: 0.0,
//                         max: 1.0,
//                         divisions: 10,
//                         label: '$volume',
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           setVolume(volume + 0.1 < 1.0 ? volume + 0.1 : 1.0);
//                         },
//                         icon: Icon(Icons.volume_up),
//                       ),
//                     ],
//                   ),
//                 ],
              
//                 ),
              
              
//               ),
//             ],
//           ),
//         ),



//     );
//   }


// }









// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:hello/services/autentica_service.dart';
// import 'package:hello/services/friends.dart';

// import '../colors/colors_theme.dart';

// class PlayCard extends StatefulWidget {
//  final String labelText;
//  final String image;
//   final VoidCallback? onUpdateScreen;
//  final Widget proximaTela;
//   const PlayCard({
//     Key? key,
    
//     required this.labelText, required this.image,required this.proximaTela,this.onUpdateScreen,
//   }) : super(key: key);



//   @override
//   State<PlayCard> createState() => _PlayCardState();
// }

// class _PlayCardState extends State<PlayCard> {


//   String? userId;


//   @override
//   void initState() {
//     super.initState();
//     _updateUserId();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     // Faça a limpeza necessária se houver algo para limpar
//   }

//   Future<void> _updateUserId() async {
//     final user = AutenticacaoServico().getUidUsuarioAtual();
//     if (mounted) {
//       setState(() {
//         userId = user;
//       });
//     }
//   }

//   Future<void> _removerAmigo() async {
//     if (userId != null) {
//         print('Amigo não encontrado.');
//       await AmigosService().removerAmigoPorNome(userId!, widget.labelText);
//       _updateUserId(); // Atualize o userId após a remoção
//       if (widget.onUpdateScreen != null && mounted) {
//         widget.onUpdateScreen!();
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return   Padding(
//         padding: const EdgeInsets.all(20.0),
//                     child: Row(
//                                      children: [
//                                       GestureDetector(
//                                         onTap: () {
//     // Navega para a tela definida pela variável
//                                   Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//       // Use aqui a variável que contém a tela para onde você quer navegar
//                                   return widget.proximaTela;
//                                   }));
//                                     },
//                                             child: Container(
//                                       padding: EdgeInsets.all(5.0),
//                                         child:  CircleAvatar(
//                                           radius: 45,
//                                           backgroundImage:widget.image.isNotEmpty
//                                               ? AssetImage(widget.image)
//                                                 : const AssetImage('assets/images/peguim.png'),
                                           
//                                     ),
//                                          ),
//                                     ),
//                                      Container(
                                     
                                      
//                                       padding: EdgeInsets.all(15),
//                                        child: SizedBox(
//                                         width: 90,
//                                         height: 30,
//                                          child:  widget.labelText.isNotEmpty
//                                      ? Text(
//                                      widget.labelText,
//                              style: TextStyle(
//                             fontSize: 20,
//                                fontWeight: FontWeight.bold,
//                                  color: Colors.white,
//                              ),
//                                    )
//                                     : Placeholder(
//                                       color: Colors.grey, // Cor do placeholder
//                                   fallbackWidth: 90,
//                                  fallbackHeight: 30,
//                                  ),
//                                        ),
//                                      ),



//                                              Container(
                                            
//                                                child: IconButton(
//                                                  icon: Icon(
//                                                   Icons.heart_broken,
//                                                    size: 30,
//                                                     color: Colors.white,
                                                                            
//                                                     ), 
                                                                              
//                                           onPressed: () async {
//                                                 if (userId != null) {
//                                                 print('Música deletada');
//                                                   showDialog(
//                                                     context: context,
//                                                     builder: (_) => AlertDialog(
//                                                       title: Text('Sucesso'),
//                                                       content: Text(' Amigo Excluido'),
//                                                       actions: [
//                                                         TextButton(
//                                                           onPressed: () {
//                                                             Navigator.pop(context);

//                                                             _removerAmigo();
//                                                           },
//                                                           child: Text('OK'),
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   );
//                                                 }
//                                               },
//                                                                                      ),
//                                              ),
                                    





//                                      ],
//                                    ),
                                 
           
         
       
       
       
//     );



  
//   }
// }