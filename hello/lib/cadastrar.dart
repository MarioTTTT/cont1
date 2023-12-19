
import 'package:flutter/material.dart';
import 'package:hello/alerta/snalart.dart';
import 'package:hello/main.dart';
import 'package:hello/services/autentica_service.dart';
import 'package:hello/services/vincular_StSto.dart';


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
  final _formKey =GlobalKey<FormState>();
  bool queroEntrar = true;
  final TextEditingController _emailControler = TextEditingController();
  final TextEditingController _nomeControler = TextEditingController();
  final TextEditingController _senhaControler = TextEditingController();

  AutenticacaoServico _autenService = AutenticacaoServico();
  FirestoreServico _firestoreServico =  FirestoreServico();

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
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:  [
                    TextFormField(
                        controller: _nomeControler,
                        keyboardType: TextInputType.emailAddress,
                        decoration:  InputDecoration(
                          
                          labelText: "Nome",
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
                            return "O campo de email esta vazio";
                          }
                          if(value.length<5){
                            return "O email é muito curto";
                
                          }
                          if(!value.contains("@")){
                            return "O email não é valido";
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
        ),

    );
     

  }
   botaoPrincipalC() {
     String nome = _nomeControler.text;
     String email = _emailControler.text;
     String senha = _senhaControler.text;
        if(_formKey.currentState!.validate()){
       
      // Se o e-mail não estiver em uso, cadastra o usuário
         _autenService.cadastrarUsuario(nome: nome, email: email, senha: senha).then((String? erro) {
        

        if(erro !=null){
            showAlertBar (context: context, texto: erro);
        }else{
          
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Inicial()));
        }
      });
       

    }else{
        
           print("Form invalido");
        
        }
      

   }
   
   }