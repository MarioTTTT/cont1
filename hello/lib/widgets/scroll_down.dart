import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../colors/colors_theme.dart';

class PlayCard extends StatefulWidget {
 final String labelText;
 final String image;
 final Widget proximaTela;
  const PlayCard({
    Key? key,
    
    required this.labelText, required this.image,required this.proximaTela
  }) : super(key: key);



  @override
  State<PlayCard> createState() => _PlayCardState();
}

class _PlayCardState extends State<PlayCard> {


  @override
  Widget build(BuildContext context) {
    return   Padding(
        padding: const EdgeInsets.all(20.0),
                    child: Row(
                                     children: [
                                      GestureDetector(
                                        onTap: () {
    // Navega para a tela definida pela variável
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      // Use aqui a variável que contém a tela para onde você quer navegar
                                  return widget.proximaTela;
                                  }));
                                    },
                                            child: Container(
                                      padding: EdgeInsets.all(5.0),
                                        child:  CircleAvatar(
                                          radius: 45,
                                          backgroundImage:widget.image.isNotEmpty
                                              ? AssetImage(widget.image)
                                                : const AssetImage('assets/images/Placeholder.png'),
                                           
                                    ),
                                         ),
                                    ),
                                     Container(
                                     
                                      
                                      padding: EdgeInsets.all(15),
                                       child: SizedBox(
                                        width: 90,
                                        height: 30,
                                         child:  widget.labelText.isNotEmpty
                                     ? Text(
                                     widget.labelText,
                             style: TextStyle(
                            fontSize: 20,
                               fontWeight: FontWeight.bold,
                                 color: Colors.white,
                             ),
                                   )
                                    : Placeholder(
                                      color: Colors.grey, // Cor do placeholder
                                  fallbackWidth: 90,
                                 fallbackHeight: 30,
                                 ),
                                       ),
                                     ),



                                             Container(
                                            
                                               child: IconButton(
                                                 icon: Icon(
                                                  Icons.heart_broken,
                                                   size: 30,
                                                    color: Colors.white,
                                                                            
                                                    ), 
                                                                              
                                                                                       onPressed: () {  },
                                                                                     ),
                                             ),
                                         Container(
                                           
                                           child: IconButton(
                                            icon: Icon(
                                             Icons.folder_shared_rounded,
                                              size: 30,
                                              color: Colors.white,
                                                                              ), 
                                                                              
                                            onPressed: () {  },
                                                                                 ),
                                         ),





                                     ],
                                   ),
                                 
           
         
       
       
       
    );



  
  }
}