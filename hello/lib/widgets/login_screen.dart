import 'package:flutter/material.dart';

import '../cadastro_main.dart';
import '../login.dart';



//Sem estado não ocorredo alteração por isso Stateless
class LoginScreen extends StatelessWidget {

  //construtor
  const LoginScreen({super.key});

  // This widget is the root of your application.
  //metodo principal widget que serve pra iniciar a aplicação
  @override
  Widget build(BuildContext context) {

    //primeiro widget iniciado padronizado nos padroes goggle
    return Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
          
            child: Column(
          
              mainAxisAlignment: MainAxisAlignment.center,
              //multiplos filhos utiliza o children
              children: <Widget>[
               
                
                  Container(
                  margin: const EdgeInsets.all(20),
                  child:const Center(
                  child: Image(
                    height: 300,
                    width: 300,
                    image: AssetImage(
                        'assets/images/music.png'),
                  ),
                  ),
                ),
           
                  // ignore: avoid_unnecessary_containers
                  Column(
            
                  
                    children: [
                      SizedBox(
                        width: 170,
                        height:40,
                       
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255,36, 72, 141),
                            elevation: 20,
                          
                            shadowColor: Colors.black,
                            shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                          ),
                         onPressed:  (){
                          Navigator.of(context).pushReplacementNamed('/');
                         }
                          ,
                          child: const Text(
                            "LOGIN",
                            textDirection: TextDirection.ltr,
                            style:TextStyle(color: Colors.white,fontSize:15)
                            
                            ),
                        
                        ),
                        
                        
                      ),
                        const SizedBox(height: 50,),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                         
                           SizedBox(
                            width: 17,
                            height:8,
                           
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                           
                              
                                
                                shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              ),
                             onPressed:  (){
                              Navigator.of(context).pushReplacementNamed('/');
                             }
                              ,
                              child: const Text(
                                '',
                               
                                
                                ),
                            
                            ),
                            
                            
                      ),
                     const  SizedBox(width:5 ,height: 2,),
                      SizedBox(
                            width: 17,
                            height:8,
                           
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255,36, 72, 141),
                       
                              
                                
                             
                              ),
                             onPressed:  (){
                              Navigator.of(context).pushReplacementNamed('/cadastro_main');
                             }
                              ,
                              child: const Text(
                                '',
                               
                                
                                ),
                            
                            ),
                            
                            
                      ),
        
        
        
        
                         ],
                       ),
                    
                    ],
                  ),
                
               
              ],
            ),
          ),
        ),
      );
  }
}

//classe que possui estados que podem ser alterados e vai substituir a Stateless
