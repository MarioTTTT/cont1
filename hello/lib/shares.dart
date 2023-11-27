import 'package:flutter/material.dart';

import 'package:hello/colors/colors_theme.dart';
import 'package:hello/playlist_perfil.dart';

import 'package:hello/widgets/shares.dart';



class ShareScreen extends StatefulWidget {
  const ShareScreen({super.key});

  @override
  State<ShareScreen> createState() => _ShareScreenState();
}

class _ShareScreenState extends State<ShareScreen> {
    final Map<int, Map<String, dynamic>> data = {
     1: {'image': '','labelText':'Samba', 'proximaTela': PlayPerfil()},
     2: {'image': '','labelText':'Sertanejo', 'proximaTela': PlayPerfil()},
     3: {'image': '','labelText':'Podcast',  'proximaTela':PlayPerfil()},
     4: {'image': '','labelText':'Forro', 'proximaTela': PlayPerfil()},
     5: {'image': '','labelText':'Pop',  'proximaTela':PlayPerfil()},
  };

  @override
  Widget build(BuildContext context) {


    
    return Scaffold(

       backgroundColor:AppColors.primaryColor,
         appBar: AppBar(
       backgroundColor: const Color.fromARGB(255,36, 72, 141),
      
       title: const Text('ColdMusic'),
           
         
                                                
       
      ),
   body:SingleChildScrollView(
   
   scrollDirection: Axis.vertical,

    child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Text(
                                  
                                 'Compartilhados',
                                      style: TextStyle(
                                  fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                 ),
                                   
                               ),
                               
                    ),
                        
                                            IconButton(
                                                     icon: Icon(
                                                     Icons.add,
                                                      size: 25,
                                                      color: Colors.white,
                                                                                       ), 
                                                      onPressed: () {  },
                                                   ),
                                                





                  ],
                ),
               Column(
              children: data.entries
                  .map(
                    (entry) => Shares(
                      image: entry.value['image']!,
                      labelText:entry.value['labelText']!,
                      proximaTela: entry.value['proximaTela']!
                    ),
                  )
                  .toList(),
            ),
              ],
              
            ),
  ),
   


    );
  }

  }
