import 'package:flutter/material.dart';
import 'package:hello/inicial.dart';
import 'package:hello/main.dart';

import 'Cadastrar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email='';
  String password='';
  @override
  Widget build(BuildContext context) {
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
                        email:text;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration:  InputDecoration(
                         fillColor: Colors.white,
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
                        
                        
                             
                       }
                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Inicial()));
                       
                       }, child: const Text("Entrar",style:TextStyle(color: Colors.white))),
                     ),
                    const SizedBox(height: 15,),
                    const Text(
                  'Se não possui conta,por favor',
                   style: TextStyle(
                                                           fontSize: 15,
                                                          fontWeight: FontWeight.bold,
                                                         color: Colors.white,
                                                           ),
                 ),
                  GestureDetector(
                    child: 
                      Text(
                  
                       'Registre-se',
                         style: TextStyle(
                                                           fontSize: 15,
                                                          fontWeight: FontWeight.bold,
                                                         color: Colors.white,
                                                           ),
                      ),
                    onTap: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Cadastrar()));}
                  ),
             


              ]
              
              ),
              
            ),
          ),
        ),

    );
  }
}