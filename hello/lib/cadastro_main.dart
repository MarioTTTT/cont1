import 'package:flutter/material.dart';
import 'package:hello/Cadastrar.dart';
import 'package:hello/cadastro_main.dart';
import 'login.dart';
import 'main.dart';



//Sem estado não ocorredo alteração por isso Stateless
class CadastroMain extends StatelessWidget {

  //construtor
  const CadastroMain({super.key});

  // This widget is the root of your application.
  //metodo principal widget que serve pra iniciar a aplicação
  @override
  Widget build(BuildContext context) {

    //primeiro widget iniciado padronizado nos padroes goggle
    return MaterialApp(
      title: 'Flutter ',
      //temazinho padrao
      theme: ThemeData(
        brightness: Brightness.dark,
      primaryColor: const Color.fromARGB(255, 4,18,46),
      
      ),
      //chama o estado inicial pertencente ao StatefulWidget
      initialRoute: '/cadastro_main',
      routes: {
        '/':(context)=>Login(),
        '/home':(context)=>MyHomePage(),
        '/cadastro_main':(context)=>MainCadastroMainState (),
        '/cadastrar':(context)=>const Cadastrar()
      },
    );
  }
}

//classe que possui estados que podem ser alterados e vai substituir a Stateless
class MainCadastroMainState extends StatefulWidget {
  const MainCadastroMainState({super.key});


//função pra chamar o state inicial 
  @override
  State<MainCadastroMainState> createState() => __MainCadastroMainState();
}




//state inicial
class __MainCadastroMainState extends State<MainCadastroMainState> {
  //@override
 // Widget build(BuildContext context) {
    // TODO: implement build
   // throw UnimplementedError();
  //}


//metodo de construção que pertence ao __MainCadastroMainStateState
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 4,18,46),
      //appBar: AppBar(title: Text(' TESTE')),
      body: Center(
      
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
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Cadastrar()));
                     }
                      ,
                      child: const Text(
                        "CADASTRAR",
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
                           
                            backgroundColor: const Color.fromARGB(255,36, 72, 141),
                          
                            
                            shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          ),
                         onPressed:  (){
                          Navigator.of(context).pushReplacementNamed('/home');
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
                            backgroundColor: Colors.white,
                   
                          
                            
                         
                          ),
                         onPressed:  (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Cadastrar()));
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
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
