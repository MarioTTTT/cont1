import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hello/playmusic.dart';
import 'package:hello/services/musics.dart';
import 'package:hello/widgets/card_inicial.dart';

import '../colors/colors_theme.dart';
import '../playlist_perfil.dart';

class BodyInicial extends StatefulWidget {
  const BodyInicial({super.key});

  @override
  State<BodyInicial> createState() => _BodyInicialState();
}

class _BodyInicialState extends State<BodyInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor:const Color.fromARGB(255, 4,18,46),
    
    body: 

     
      Padding(
       padding: const EdgeInsets.all(15.0),
       child:  SingleChildScrollView(
                scrollDirection: Axis.vertical,
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
            
           children: [
             
              
              const Padding(
                padding: EdgeInsets.only(top:60), 
                child: Text(
                  
                 'Novidades',
                      style: TextStyle(
                  fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                 ), 
                      ),
              ),
           
               
               SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
            
                 child: Row(
                       
                    
                    children: [
                     
                              Column(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.all(10.0),
                                   child: Container(
                                      padding: const EdgeInsets.all(5.0),
                                   child: CircleAvatar(
                                   
                                       
                                           radius: 50,
                                  child: GestureDetector(
                                  onTap: () async {
                                final musicID = await MusicaService().buscarIdMusicaPorNome('Smells Like Teen Spirit');
                                 final musicData = await MusicaService().getMusicaById(musicID as String);
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MusicTocar(musicaData: musicData),
                                    ));
                                  },
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundImage: NetworkImage('https://i0.wp.com/sahiphopza.co/wp-content/uploads/2021/07/nirvana-smells-like-teen-spirit.jpg?ssl=1'),
                                    ),
                                  ),
                                           
                                    
                                   ),
                                   
                                   ),
                                 ),
                                           const SizedBox(height: 2),
                                           const Text(
                                            'Nirvana',
                                               style: TextStyle(
                                               fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                             color: Colors.white,
                                               ),
                                             ),




                               ],


                             ),
                                  
                              Column(

                               children: [
                                 Container(
                                      padding: const EdgeInsets.all(10.0),
                                 child: CircleAvatar(
                                  
                                    radius: 50,
                                     child: GestureDetector(
                                  onTap: () async {
                                final musicID = await MusicaService().buscarIdMusicaPorNome('Thriller');
                                 final musicData = await MusicaService().getMusicaById(musicID as String);
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MusicTocar(musicaData: musicData),
                                    ));
                                  },
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundImage: NetworkImage('https://i.discogs.com/ilnZBVjV2VXezZNJBA-sIqEqKrSbpG7ahQYot6rGTXA/rs:fit/g:sm/q:90/h:600/w:597/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTc2NDcw/MTUtMTQ4MTgyNzQy/OC01NzUwLmpwZWc.jpeg'),
                                    ),
                                  ),
                                         
                                   
                                 ),
                                 
                                 ),
                                           const SizedBox(height: 2),
                                           const Text(
                                            'MichaelJackson',
                                               style: TextStyle(
                                               fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                             color: Colors.white,
                                               ),
                                             ),




                               ],


                             ),
                              
                              Column(
                               children: [
                                 Container(
                                      padding: const EdgeInsets.all(10.0),
                                
                                 
                                   child:  CircleAvatar(
                                   
                                       
                                           radius: 50,
                                     child: GestureDetector(
                                  onTap: () async {
                                final musicID = await MusicaService().buscarIdMusicaPorNome('Look At Me!');
                                 final musicData = await MusicaService().getMusicaById(musicID as String);
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => MusicTocar(musicaData: musicData),
                                    ));
                                  },
                                    child: CircleAvatar(
                                      radius: 50,
                                      backgroundImage: NetworkImage('https://i.pinimg.com/236x/c5/ea/43/c5ea431d16926fae9e5bf8152cbfff4d.jpg'),
                                    ),
                                  ),
                                      
                                           
                                    
                                   ),
                                
                                 
                                 ),
                                           const SizedBox(height: 2),
                                           const Text(
                                            'XXXTENTATION',
                                               style: TextStyle(
                                               fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                             color: Colors.white,
                                               ),
                                             ),




                               ],


                             ),


                              Column(
                               children: [
                                 Container(
                                      padding: const EdgeInsets.all(10.0),
                                
                                 
                                   child: const CircleAvatar(
                                   
                                       
                                           radius: 50,
                                       backgroundImage: AssetImage(
                                           'assets/images/KP.png'),
                                           
                                    
                                  
                                 ),
                                 
                                 ),
                                           const SizedBox(height: 2),
                                           const Text(
                                            'Katty Perry',
                                               style: TextStyle(
                                               fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                             color: Colors.white,
                                               ),
                                             ),

                               ],


                             ),


                    ],
            

                  ),
               ),
             
         
             

             
               const Text(
                    
                   'Recomendações',
                        style: TextStyle(
                    fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                   ),
                     
                 ),
                 
              
               
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                
                child: Row(
                    
                     
                   
                    children: [
                     GestureDetector(
                            onTap: () async {
                              
                             final musicID = await MusicaService().buscarIdMusicaPorNome('Yourself');
                                     final musicData = await MusicaService().getMusicaById(musicID as String);
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MusicTocar(musicaData: musicData)));
                               },
                       child: Container(
                     margin: const EdgeInsets.all(10),
                       child: const Image(
                       height: 90,
                        width: 80,
                        image: NetworkImage('https://static.stereogum.com/uploads/2022/10/Eminem-Lose-Yourself-1666109360-520x5201-1666540295.jpeg'),
                   ),
                   ),
                          ),
                                GestureDetector(
                            onTap: () async {
                              
                             final musicID = await MusicaService().buscarIdMusicaPorNome('bring me to life');
                                     final musicData = await MusicaService().getMusicaById(musicID as String);
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MusicTocar(musicaData: musicData)));
                               },
                       child: Container(
                      margin: const EdgeInsets.all(10),
                       child: const Image(
                       height: 90,
                        width: 80,
                        image: NetworkImage('https://akamai.sscdn.co/uploadfile/letras/albuns/c/e/0/6/874991585597114.jpg'),
                        ),
                          ),
                          ),
                              
                             GestureDetector(
                            onTap: () async {
                              
                             final musicID = await MusicaService().buscarIdMusicaPorNome('In The End');
                                     final musicData = await MusicaService().getMusicaById(musicID as String);
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MusicTocar(musicaData: musicData)));
                               },
                       child: Container(
                      margin: const EdgeInsets.all(10),
                       child: const Image(
                       height: 90,
                        width: 80,
                        image: NetworkImage('https://i1.sndcdn.com/artworks-000386461686-h1f08n-t500x500.jpg'),
                        ),
                          ),
                          ),
                              
                             GestureDetector(
                            onTap: () async {
                              
                             final musicID = await MusicaService().buscarIdMusicaPorNome('Psychosocial');
                                     final musicData = await MusicaService().getMusicaById(musicID as String);
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => MusicTocar(musicaData: musicData)));
                               },
                       child: Container(
                      margin: const EdgeInsets.all(10),
                       child: const Image(
                       height: 90,
                        width: 80,
                        image: NetworkImage('https://wikimetalstore.com.br/produtos/imagens/229_1.jpg'),
                        ),
                          ),
                          ),
       
                             
                    ],
                  ),
              ),
               const Text(
                    
                   'Outras Musicas',
                        style: TextStyle(
                    fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                   ),
                     
                 ),
       
             const SizedBox(width: 15),
             


                
                 Column(
                    
                     
                   
                    children: [
                                   CustomCard(title:'Willow' ,subtitle:'TaylorSwift' , imageUrl:'https://miro.medium.com/v2/resize:fit:1400/1*5vNSL7_g289H0XVVPZHTHg.jpeg'),
                                   CustomCard(title:'Another Brick in The Wall' ,subtitle:'Pink Floyd' , imageUrl:'https://i1.sndcdn.com/artworks-000095031213-ohippm-t500x500.jpg'),
                                   CustomCard(title:'Bloody Mary' ,subtitle:'Lady gaga' , imageUrl:'https://i1.sndcdn.com/artworks-000010634622-9b20i9-t500x500.jpg'),
                                    CustomCard(title:'Controllah' ,subtitle:'Gorillaz ft.Mc BinLaden' , imageUrl:'https://i1.sndcdn.com/artworks-4DjCzLxDC7VUd0Vz-y3tYXg-t500x500.jpg'),
                                       ],
                                        




                                     ),
                                   
                                
                     
                                   
                              
                    ],
                  ),
              
       
       
       
           
         ),
       ),
      






     
    );

  }
}