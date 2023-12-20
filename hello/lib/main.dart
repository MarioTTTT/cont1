import 'package:flutter/material.dart';
import 'package:hello/admin.dart';
import 'package:hello/cadastrar.dart';
import 'package:hello/services/audio_up.dart';
import 'package:hello/widgets/cadastro_screen.dart';
import 'package:hello/widgets/login_screen.dart';

import 'cadastro_main.dart';
import 'login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    
    options: DefaultFirebaseOptions.currentPlatform,
   );


  runApp(const MyApp());
}

final MusicStorageService musicStorageService = MusicStorageService();//



//Sem estado não ocorredo alteração por isso Stateless
class MyApp extends StatelessWidget {

  //construtor
  const MyApp({super.key});

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
      initialRoute: '/home',
      routes: {
        '/':(context)=>Login(),
        '/home':(context)=>MyHomePage(),
        '/cadastro_main':(context)=>CadastroMain(),
       '/cadastrar':(context)=>const Cadastrar(),
       '/admin':(context)=>const AdminMusicAddScreen()
      },

      
    );
  }
}

//classe que possui estados que podem ser alterados e vai substituir a Stateless
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


//função pra chamar o state inicial 
  @override
  State<MyHomePage> createState() => _MyHomePageState();
  
}




//state inicial
class _MyHomePageState extends State<MyHomePage> {
   final List<Widget> pages = [
    LoginScreen(),
    CadastriScreenMain(),
  ];
  //@override
 // Widget build(BuildContext context) {
    // TODO: implement build
   // throw UnimplementedError();
  //}









//metodo de construção que pertence ao _MyHomePageState
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 4,18,46),
      //appBar: AppBar(title: Text(' TESTE')),
      body:PageView(
        children: pages,
      ),
 
  
     // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
