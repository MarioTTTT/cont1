import 'package:flutter/material.dart';
import 'package:hello/back.dart';
import 'package:hello/settings.dart';

import 'colors/colors_theme.dart';


class BodyInicial extends StatefulWidget {
  const BodyInicial({super.key});

  @override
  State<BodyInicial> createState() => _BodyInicialState();
}

class _BodyInicialState extends State<BodyInicial> {
  int _selectedIndex = 0;
  


  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      
    backgroundColor:const Color.fromARGB(255, 4,18,46),
    appBar: AppBar(
       backgroundColor: const Color.fromARGB(255,36, 72, 141),
      
       title: const Text('HOMEPAGE'),

       leading: IconButton(
                                          icon: Icon(
                                           Icons.account_circle_sharp,
                                            size: 30,
                                            color: Colors.white,
                                                                            ), 
                                                                            
                                          onPressed: () {  },
                                        ),
       
      ),
         
    
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
                  
                 'Artistas',
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
                                   padding: const EdgeInsets.all(2.0),
                                   child: Container(
                                      padding: const EdgeInsets.all(5.0),
                                   child: const CircleAvatar(
                                   
                                       
                                           radius: 50,
                                       backgroundImage: AssetImage(
                                           'assets/images/drake.jpg'),
                                           
                                    
                                   ),
                                   
                                   ),
                                 ),
                                           const SizedBox(height: 2),
                                           const Text(
                                            'Drake',
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
                                      padding: const EdgeInsets.all(5.0),
                                 child: const CircleAvatar(
                                  
                                    radius: 50,
                                     backgroundImage: AssetImage(
                                         'assets/images/djavan.png'),
                                         
                                   
                                 ),
                                 
                                 ),
                                           const SizedBox(height: 2),
                                           const Text(
                                            'Djavan',
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
                                      padding: const EdgeInsets.all(5.0),
                                
                                 
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


                              Column(
                               children: [
                                 Container(
                                      padding: const EdgeInsets.all(5.0),
                                
                                 
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
                      Container(
                                 margin: const EdgeInsets.all(10),
                                
                                   child: const Image(
                                     height: 95,
                                     width: 95,
                                     image: AssetImage(
                                         'assets/images/drake.jpg'),
                                         
                                   ),
                                 
                                 ),
                                  Container(
                             margin: const EdgeInsets.all(10),
                             child:const Image(
                               height: 90,
                               width: 90,
                               image: AssetImage(
                                   'assets/images/djavan.png'),
                                   
                             ),
                             
                            
                             ),
                              Container(
                             margin: const EdgeInsets.all(10),
                             child:const Image(
                               height: 90,
                               width: 90,
                               image: AssetImage(
                                   'assets/images/KP.png'),
                                   
                             ),
                             
                            
                             ),
                              Container(
                             margin: const EdgeInsets.all(10),
                             child:const Image(
                               height:90,
                               width: 90,
                               image: AssetImage(
                                   'assets/images/KP.png'),
                                   
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
                      Card(
                        color: Color.fromARGB(255,36, 72, 141),
                        child: Container(
                                   margin: const EdgeInsets.all(10),
                                  
                                     child: Row(
                                       children: [
                                         const CircleAvatar(
                                          radius: 45,
                                          backgroundImage: AssetImage(
                                           'assets/images/blodm.jpg'),
                                           
                                    ),
                      
                                           const SizedBox(width: 15),
                      
                                                     Column(
                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                       children: const [
                                                        
                                                         Text(
                                                           'Willow',
                                                             style: TextStyle(
                                                             fontSize: 15,
                                                            fontWeight: FontWeight.bold,
                                                             color: Colors.white,
                                                          ),
                                                           ),
                                                         
                                                      Text(
                                                        'TaylorSwift',
                                                          style: TextStyle(
                                                          fontSize: 12,
                                                         fontWeight: FontWeight.bold,
                                                          color: AppColors. textun,
                                                       ),
                                                        ),
                      
                      
                      
                      
                                                       ],
                                                     ),
                                            
                      
                                        Container(
                                      margin: const EdgeInsets.only(left:70),
                                     child: Row(
                                       children: [
                                         IconButton(
                                           icon: Icon(
                                           Icons.add,
                                            size: 40,
                                            color: Colors.white,
                                                                             ), 
                                            onPressed: () {  },
                                         ),
                                        IconButton(
                                          icon: Icon(
                                           Icons.play_circle,
                                            size: 40,
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
                                   Card(
                                    color: Color.fromARGB(255,36, 72, 141),
                                     shape: const RoundedRectangleBorder( 
                                      
                                        
                                        //<-- SEE HERE
                                     side: BorderSide(
                                    color:  Color.fromARGB(255, 36, 72, 141),

                                 
                                          ),
                                         ),
                                  shadowColor: Colors.black,
                                     child: Column(
                                      
                                       children: [
                                         Container(
                                        margin: const EdgeInsets.all(10),
                                                                   
                                         child: Row(
                                           children: [
                                             const CircleAvatar(
                                              radius: 45,
                                              backgroundImage: AssetImage(
                                               'assets/images/alok.jpg'),
                                               
                                                                     ),
                                   
                                               const SizedBox(width: 15),
                                   
                                   
                                   
                                                 Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                   children: const [
                                                     Text(
                                                      'Bloody Mary',
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
                                      margin: const EdgeInsets.only(left:50),
                                     child: Row(
                                       children: [
                                         IconButton(
                                           icon: Icon(
                                           Icons.add,
                                            size: 40,
                                            color: Colors.white,
                                                                             ), 
                                            onPressed: () {  },
                                         ),
                                        IconButton(
                                          icon: Icon(
                                           Icons.play_circle,
                                            size: 40,
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
                                   
                                   
                                   
                                   
                                   
                                                                    
                                       ],
                                     ),
                                   ),
                                Card(
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
                                           Icons.add,
                                            size: 40,
                                            color: Colors.white,
                                                                             ), 
                                            onPressed: () {  },
                                         ),
                                        IconButton(
                                          icon: Icon(
                                           Icons.play_circle,
                                            size: 40,
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
                             Card(
                              color: Color.fromARGB(255,36, 72, 141),
                               child: Container(
                                   margin: const EdgeInsets.all(10),
                                  
                                     child: Row(
                                       children: [
                                         const CircleAvatar(
                                          radius: 45,
                                          backgroundImage: AssetImage(
                                           'assets/images/kod.jpg'),
                                           
                                    ),
                             
                                           const SizedBox(width: 15),
                                             Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                               children: const [
                                                 Text(
                                                  'Controlah',
                                                     style: TextStyle(
                                                     fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                   color: Colors.white,
                                                     ),
                                                   ),
                             
                             
                                               Text(
                                                 'Gorillaz ft.Mc BinLaden',
                                                   style: TextStyle(
                                                   fontSize: 12,
                                                  fontWeight: FontWeight.bold,
                                                   color: AppColors. textun,
                                                ),
                                                 ),
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                             
                                               ],
                                             ),


                                         Container(
                                      margin: const EdgeInsets.only(left:10),
                                     child: Row(
                                       children: [
                                         IconButton(
                                           icon: Icon(
                                           Icons.add,
                                            size: 40,
                                            color: Colors.white,
                                                                             ), 
                                            onPressed: () {  },
                                         ),
                                        IconButton(
                                          icon: Icon(
                                           Icons.play_circle,
                                            size: 40,
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
                    ],
                  ),
              
       
       
       
           ],
         ),
       ),
      






     ),
           
    
 floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Lógica para o botão flutuante
        },
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),





    bottomNavigationBar: Material(
  color: Colors.transparent,
  child: Theme(
    data: Theme.of(context).copyWith(
      canvasColor: const Color.fromARGB(255, 36, 72, 141),
    ),
    child: ClipRect(
      child: BottomAppBar(
        shape:  const CircularNotchedRectangle(), // Adiciona o formato circular
        notchMargin: 8.0,
      

        child: BottomNavigationBar(
          selectedLabelStyle: const TextStyle(
            color: Colors.white,
        
            decorationThickness: 2,
          ),
          backgroundColor: const Color.fromARGB(255, 36, 72, 141),
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color.fromARGB(255, 5, 35, 91),
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
      switch (index) {
    case 0:
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => BodyInicial()));
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MySettings()));
      break;
    case 2:
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
      break;
    case 3:
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyApp()));
      break;
    default:
      break;
    }




          },




          
          items:[
            BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.home), onPressed: () {}), label: "Home"),
            BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.favorite), onPressed: () {}), label: "Favorite"),
            BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.settings), onPressed: () {}), label: "Settings"),
            BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.search), onPressed: () {}), label: "Search"),
          ],
        ),
      ),
    ),
  ),
),
floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    )
    ;
  }
 
}

   
