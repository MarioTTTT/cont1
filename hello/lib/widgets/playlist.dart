import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../colors/colors_theme.dart';

class PlayCard extends StatefulWidget {


  const PlayCard({super.key});

  @override
  State<PlayCard> createState() => _PlayCardState();
}

class _PlayCardState extends State<PlayCard> {


  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(10.0),
            child: Card(
                                  color: Color.fromARGB(255,36, 72, 141),
                          child: Container(
                                   margin: const EdgeInsets.all(10),
                                  
                                     child: Row(
                                       children: [
                                         const CircleAvatar(
                                          radius: 45,
                                          backgroundImage: AssetImage(
                                           'assets/images/willow.jpg'),
                                           
                                    ),
 
                                           const SizedBox(width: 15),
                                             Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                               children: const [
                                                 Text(
                                                  'Hear me Now',
                                                     style: TextStyle(
                                                     fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                   color: Colors.white,
                                                     ),
                                                   ),
 
 
                                               Text(
                                                 'Lady gaga',
                                                   style: TextStyle(
                                                   fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                   color: AppColors. textun,
                                                ),
                                                 ),
 

 
 
                                               ],
                                             ),
                                         Container(
                                      margin: const EdgeInsets.only(left:45),
                                     child: Row(
                                       children: [
                                         IconButton(
                                           icon: Icon(
                                           Icons.cancel_presentation_outlined,
                                            size: 30,
                                            color: Colors.white,
                                                                             ), 
                                            onPressed: () {  },
                                         ),
                                        IconButton(
                                          icon: Icon(
                                           Icons.favorite_border,
                                            size: 30,
                                            color: Colors.white,
                                                                            ), 
                                                                            
                                          onPressed: () {  },
                                        ),


                                       ],
                                     ),
                                


                             )
                                        

                                       ],
                                     ),
                                   
                                   ),
      ),
            
    );



  
  }
}