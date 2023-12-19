import 'package:flutter/material.dart';
import 'package:hello/alerta/snalart.dart';
import 'package:hello/inicial.dart';
import 'package:hello/main.dart';
import 'package:hello/services/autentica_service.dart';

import 'Cadastrar.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email='';
  String password='';
    final TextEditingController _emailControler = TextEditingController();
  final TextEditingController _senhaControler = TextEditingController();
    final _formKey =GlobalKey<FormState>();
      AutenticacaoServico _autenService = AutenticacaoServico();
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
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                      TextFormField(
                          controller: _emailControler,
                          keyboardType: TextInputType.emailAddress,
                          decoration:  InputDecoration(
                            
                            labelText: "Email",
                             border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(20.0), // Altere o valor conforme desejado
                              ),
                             
                         ),
                         validator: (String?value){
                            if(value == null){
                              return "O campo de nome esta vazio";
                            }
                            if(value.length<5){
                              return "O nomeé muito curto";
                  
                            }
                            
                            return null;
                         }
                         ),
                       const SizedBox(height: 10,),
                        TextFormField(
                           controller: _senhaControler,
                            obscureText: true,
                            decoration:  InputDecoration(
                            
                            labelText: "Password",
                            border: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(20.0), // Altere o valor conforme desejado
                              ),
                              
                         ),
                        validator: (String?value){
                            if(value == null){
                              return "O campo de senha esta vazio";
                            }
                            if(value.length<5){
                              return "A senha é muito curto";
                  
                            }
                            
                            return null;
                         }
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
                          onPressed: (){
                            botaoPrincipalC();
                          
                               
                         
                          
                         
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
        ),

    );




    
  }



  botaoPrincipalC() {
     String email= _emailControler.text;

     String senha = _senhaControler.text;
     _autenService.LogarUser(email:email, senha:senha).then((String? erro ){
     
             if(erro != null){
                      showAlertBar (context: context, texto: erro);
             }else{
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Inicial()));
             }
      },
      );
      

   }
   
}