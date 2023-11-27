import 'package:flutter/material.dart';

import 'package:hello/colors/colors_theme.dart';
import 'package:hello/perfil.dart';

import 'package:hello/widgets/playlist.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});



  @override
  Widget build(BuildContext context) {
      return  MaterialApp(


      initialRoute:'/',
        routes: {
       '/': (context) =>  const MyFavorites(),
      'perfil': (context) =>  const PerfilScreen(),
      },

        

        
    );
  }
}

class MyFavorites extends StatefulWidget{
  const MyFavorites({super.key});


//função pra chamar o state inicial 
  @override
  State<MyFavorites> createState() => _MyFavoritesState();
}
class _MyFavoritesState extends State<MyFavorites>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

       backgroundColor:AppColors.primaryColor,
        
   body:SingleChildScrollView(
   
   scrollDirection: Axis.vertical,

    child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(25.0),
                      child: Text(
                                  
                                 'Favoritos',
                                      style: TextStyle(
                                  fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                 ),
                                   
                               ),
                               
                    ),
                        
                                            IconButton(
                                                     icon: const Icon(
                                                     Icons.share_rounded,
                                                      size: 25,
                                                      color: Colors.white,
                                                                                       ), 
                                                      onPressed: () {  },
                                                   ),
                                                 IconButton(
                                                     icon: const Icon(
                                                     Icons.favorite,
                                                      size: 25,
                                                      color: Colors.white,
                                                                                       ), 
                                                      onPressed: () {  },
                                                   ),
                                                





                  ],
                ),
                  
                    const PlayCard(),
                   const PlayCard(),
                    const PlayCard(),
                      const PlayCard(),
              ],
              
            ),
  ),
   


    );
  }


  
}