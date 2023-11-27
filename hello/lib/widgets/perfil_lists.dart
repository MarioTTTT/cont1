import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../colors/colors_theme.dart';

class PerfilList extends StatefulWidget {
  final String labelText;
   final Widget proximaTela;
  const PerfilList({
    Key? key,
    required this.proximaTela,
    required this.labelText,
  }) : super(key: key);


  @override
  State<PerfilList> createState() => _PerfilList_State();
}

class _PerfilList_State extends State<PerfilList> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                                      padding: const EdgeInsets.all(5.0),
                                        child: Image(
                                      height: 100,
                                          width: 100,
                                         image: AssetImage('assets/images/KP.png'),
                                       ),
                                         ),
                                    ),
                                     Container(
                                     
                                      
                                      padding: EdgeInsets.all(15),
                                       child: SizedBox(
                                        width: 90,
                                        height: 30,
                                         child: Text(
                                                           widget.labelText,
                                                             style: TextStyle(
                                                             fontSize: 15,
                                                            fontWeight: FontWeight.bold,
                                                           color: Colors.white,
                                                             ),
                                                           ),
                                       ),
                                     ),



                                             Container(
                                            
                                               child: IconButton(
                                                 icon: Icon(
                                                  Icons.cancel_presentation_outlined,
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