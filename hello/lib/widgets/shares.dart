import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../colors/colors_theme.dart';

class Shares extends StatefulWidget {

 final String image;
  final String labelText;
 final  Widget proximaTela;

  const Shares({
    Key? key,
    
     required this.image,required this.proximaTela,required this.labelText
  }) : super(key: key);



  @override
  State<Shares> createState() => _SharesState();
}

class _SharesState extends State<Shares> {


  @override
  Widget build(BuildContext context) {
    return  Padding(
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

                                  





                                     ],
                                   ),
                                 
           
         
       
       
       
    );


  
  }
}