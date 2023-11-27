import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hello/colors/colors_theme.dart';
import 'package:hello/inicial.dart';
import 'package:hello/playlist_perfil.dart';
import 'package:hello/widgets/perfil_lists.dart';

import 'friend_screen.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({super.key});

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  @override
  Widget build(BuildContext context) {


    
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
       appBar: AppBar(
       backgroundColor: const Color.fromARGB(255,36, 72, 141),
      
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
         
        body:  SingleChildScrollView(
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
                                                               backgroundImage: AssetImage(
                                                                   'assets/images/drake.jpg'),
                                                                   
                                                            
                                                           ),
                                                           
                                                           ),
  ),

                                            const Text(
                              
                                                  'Marcos',
                                            style: TextStyle(
                                            fontSize: 15,
                                           fontWeight: FontWeight.bold,
                                         color: Colors.white,
                                              ),

                                          )
                        ],
                      ),

                                            Padding(
                                              padding: const EdgeInsets.all(25.0),
                                              child: Container(
                                                   
                                                  width: 35,
                                                  height: 35,
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:AppColors.secondaryColor),
                                                  
                                                    child: const Icon(Icons.camera_alt,
                                                        size: 25,
                                                        color: Colors.white,
                                                        ),
                                                     
                                                     ),
                                            ),






                    ],
                  ),
                                            



                                                   
                                               
                                             
                                            
                                          


                                            IconButton(
                                                     icon: Icon(
                                                     Icons.group,
                                                      size: 20,
                                                      color: Colors.white,
                                                                                       ), 
                                                 onPressed: () {  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const FriendScreen()));
                                                  },
                                                   ),
                                                


                   
                ]
                ,
              ),

                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: const Text(
                              
                             'Playslists',
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
                                                                            
                                          onPressed: () {  },
                                        ),



                        ],
                      ),




                PerfilList(labelText: "PopMusic",proximaTela: PlayPerfil(),),
                PerfilList(labelText: "Kpop",proximaTela:PlayPerfil(),),
                PerfilList(labelText: "Jazz",proximaTela: PlayPerfil(),),
                PerfilList(labelText: "Podcast",proximaTela: PlayPerfil(),),
              
                    ],
                  )
                 
                  








            ],
          ),


          
        ),



    );
  }
}