// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:image_picker/image_picker.dart';

// class AudioUploadScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload de Áudio'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             File? audioFile = await selectAudio();
//             if (audioFile != null) {
//               await _uploadAudio(audioFile);
//             } else {
//               print('Nenhum arquivo selecionado');
//             }
//           },
//           child: Text('Selecionar Áudio'),
//         ),
//       ),
//     );
//   }

//   Future<File?> selectAudio() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickVideo(source: ImageSource.gallery);

//     if (pickedFile != null) {
//       return File(pickedFile.path);
//     } else {
//       return null;
//     }
//   }

//   Future<void> _uploadAudio(File audioFile) async {
//     FirebaseStorage storage = FirebaseStorage.instance;
//     Reference storageRef = storage.ref().child('caminho/para/seu/arquivo.mp3');

//     try {
//       UploadTask uploadTask = storageRef.putFile(audioFile);
//       await uploadTask.whenComplete(() => print('Upload completo'));
//     } catch (e) {
//       print('Erro ao fazer upload: $e');
//     }
//   }
// }



// import 'package:cloud_firestore/cloud_firestore.dart';

// class PlaylistService {
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   // Cria uma nova playlist associada ao UID do usuário
//   Future<void> criarPlaylist(String userId, String nomePlaylist, List<String> musicas) async {
//     try {
//       DocumentReference playlistRef = _firestore.collection('users').doc(userId).collection('playlist').doc();

//       await playlistRef.set({
//         'nome': nomePlaylist,
//         'musicas': musicas, // Lista de IDs das músicas na playlist
//         // Outros campos relevantes da playlist, se houver
//       });
//     } catch (e) {
//       print('Erro ao criar playlist: $e');
//     }
//   }

//   // Adiciona uma música à playlist existente
//   Future<void> adicionarMusicaPlaylist(String userId, String playlistId, String musicaId) async {
//     try {
//       DocumentReference playlistRef = _firestore.collection('users').doc(userId).collection('playlist').doc(playlistId);

//       DocumentSnapshot playlistSnapshot = await playlistRef.get();
//       if (playlistSnapshot.exists) {
//         List<dynamic> musicas = playlistSnapshot.get('musicas');
//         musicas.add(musicaId);

//         await playlistRef.update({'musicas': musicas});
//       }
//     } catch (e) {
//       print('Erro ao adicionar música à playlist: $e');
//     }
//   }

//   // Recupera todas as playlists de um usuário
//   Stream<QuerySnapshot<Map<String, dynamic>>> obterPlaylistsUsuario(String userId) {
//     return _firestore.collection('users').doc(userId).collection('playlist').snapshots();
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
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:hello/colors/colors_theme.dart';
// import 'package:hello/inicial.dart';
// import 'package:hello/playlist_perfil.dart';
// import 'package:hello/widgets/perfil_lists.dart';

// import 'friend_screen.dart';

// class PerfilScreen extends StatefulWidget {
//   const PerfilScreen({super.key});

//   @override
//   State<PerfilScreen> createState() => _PerfilScreenState();
// }

// class _PerfilScreenState extends State<PerfilScreen> {
//   @override
//   Widget build(BuildContext context) {


    
//     return Scaffold(
//       backgroundColor: AppColors.primaryColor,
//        appBar: AppBar(
//        backgroundColor: const Color.fromARGB(255,36, 72, 141),
      
//        title: const Text('ColdMusic'),

//        leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//              Navigator.push(
//                context,
//                  MaterialPageRoute(builder: (context) => Inicial()),
//     );
//           },
//         ),
       
//       ),
         
//         body:  SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                  Stack(
//                     children: [
//                       Column(
//                         children: [
//                           Center(
                          
                                                      
                                                       
//                                                            child: Container(
//                                                               padding: const EdgeInsets.all(20.0),
//                                                            child: const CircleAvatar(
                                                           
                                                               
//                                                                    radius: 60,
//                                                                backgroundImage: AssetImage(
//                                                                    'assets/images/drake.jpg'),
                                                                   
                                                            
//                                                            ),
                                                           
//                                                            ),
//   ),

//                                             const Text(
                              
//                                                   'Marcos',
//                                             style: TextStyle(
//                                             fontSize: 15,
//                                            fontWeight: FontWeight.bold,
//                                          color: Colors.white,
//                                               ),

//                                           )
//                         ],
//                       ),

//                                             Padding(
//                                               padding: const EdgeInsets.all(25.0),
//                                               child: Container(
                                                   
//                                                   width: 35,
//                                                   height: 35,
//                                                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:AppColors.secondaryColor),
                                                  
//                                                     child: const Icon(Icons.camera_alt,
//                                                         size: 25,
//                                                         color: Colors.white,
//                                                         ),
                                                     
//                                                      ),
//                                             ),






//                     ],
//                   ),
                                            



                                                   
                                               
                                             
                                            
                                          


//                                             IconButton(
//                                                      icon: Icon(
//                                                      Icons.group,
//                                                       size: 20,
//                                                       color: Colors.white,
//                                                                                        ), 
//                                                  onPressed: () {  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const FriendScreen()));
//                                                   },
//                                                    ),
                                                


                   
//                 ]
//                 ,
//               ),

//                   Column(
//                     children: [
//                       Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(20.0),
//                             child: const Text(
                              
//                              'Playslists',
//                                   style: TextStyle(
//                               fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                              ),
                               
//                                            ),
//                           ),
                       
//                       IconButton(
//                                           icon: Icon(
//                                            Icons.add_circle_outline,
//                                             size: 30,
//                                             color: Colors.white,
//                                                                             ), 
                                                                            
//                                           onPressed: () {  },
//                                         ),



//                         ],
//                       ),




//                 PerfilList(labelText: "PopMusic",proximaTela: PlayPerfil(),),
//                 PerfilList(labelText: "Kpop",proximaTela:PlayPerfil(),),
//                 PerfilList(labelText: "Jazz",proximaTela: PlayPerfil(),),
//                 PerfilList(labelText: "Podcast",proximaTela: PlayPerfil(),),
              
//                     ],
//                   )
                 
                  








//             ],
//           ),


          
//         ),



//     );
//   }
// }