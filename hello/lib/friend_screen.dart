import 'package:flutter/material.dart';

import 'package:hello/colors/colors_theme.dart';
import 'package:hello/shares.dart';
import 'package:hello/widgets/scroll_down.dart';



class FriendScreen extends StatefulWidget {
  const FriendScreen({super.key});

  @override
  State<FriendScreen> createState() => _FriendScreenState();
}

class _FriendScreenState extends State<FriendScreen> {
    final Map<int, Map<String, dynamic>> data = {
     1: {'image': '', 'text': 'John', 'proximaTela': ShareScreen ()},
     2: {'image': '', 'text': 'Ana', 'proximaTela': ShareScreen ()},
     3: {'image': '', 'text': 'Paulo', 'proximaTela': ShareScreen ()},
     4: {'image': '', 'text': 'Felipe', 'proximaTela': ShareScreen ()},
     5: {'image': '', 'text': 'Gusta', 'proximaTela':ShareScreen ()},
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
                                  
                                 'Amigos',
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
                    (entry) => PlayCard(
                      image: entry.value['image']!,
                      labelText: entry.value['text']!,
                      proximaTela: entry.value['proximaTela'],
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
