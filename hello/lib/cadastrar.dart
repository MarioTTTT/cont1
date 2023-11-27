import 'package:flutter/material.dart';
import 'package:hello/main.dart';

import 'inicial.dart';


class Cadastrar extends StatefulWidget {
  const Cadastrar({super.key});

  @override
  State<Cadastrar> createState() => _Cadastrar();
}

class _Cadastrar extends State<Cadastrar> {
  String nome='';
  String email='';
  String password='';
  @override
  Widget build(BuildContext context)  {
    return Scaffold(
       backgroundColor:const Color.fromARGB(255, 4,18,46),
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height:MediaQuery.of(context).size.height,
           
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  TextField(
                      onChanged: (text){
                        nome:text;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration:  InputDecoration(
                        
                        labelText: "Nome",
                         border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(20.0), // Altere o valor conforme desejado
                          ),
                       
                     )
                     
                     ),
                      const SizedBox(height: 10,),
                     TextField(
                      onChanged: (text){
                        email:text;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration:  InputDecoration(
                        
                        labelText: "Email",
                         border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(20.0), // Altere o valor conforme desejado
                          ),
                       
                     )
                     
                     ),
                     const SizedBox(height: 10,),
                      TextField(
                     
                        onChanged: (text){
                         password:text;
                        },
                        obscureText: true,
                        decoration:  InputDecoration(
                        
                        labelText: "Password",
                        border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(20.0), // Altere o valor conforme desejado
                          ),
            
                     ),
                    
                     ),
                    const SizedBox(height: 50,),
                     SizedBox(
                       width: 170,
                       height:40,
                       child: ElevatedButton(
                        
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255,36, 72, 141),
                          elevation: 20,
                        
                          shadowColor: Colors.black,
                          shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                        ),
                        onPressed: (){if(email=='jm@gmail.com'&&password=='123'){
                          print('CORRETO');
                        
                             
                       }
                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Inicial()));
                       
                       }, child: const Text("Cadastrar", style:TextStyle(color: Colors.white))
                        
                       
                       ),
                       
                     ),
                      const SizedBox(height: 15,),
                    const Text(
                  'Se possui conta,por favor',
                 ),
                  GestureDetector(
                    child: 
                      const Text(
                  
                       'Entre',
                 ),
                    onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomePage()));}
                  ),
             


              ]
              
              ),
              
            ),
          ),
        ),

    );
  }
}