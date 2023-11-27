import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}



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
      home: const MyHomePage(
        backgroundColor:Color.fromARGB(255, 4,18,46),
        
        title: ''),
    );
  }
}

//classe que possui estados que podem ser alterados e vai substituir a Stateless
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required Color backgroundColor});

  final String title;
//função pra retornar o state inicial
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}




//state inicial
class _MyHomePageState extends State<MyHomePage> {
  //@override
 // Widget build(BuildContext context) {
    // TODO: implement build
   // throw UnimplementedError();
  //}
 int _counter = 0;

void _incrementCounter() {
  //altera o estado
setState(() {
     
  _counter++;
  });
  }







  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 4,18,46),
      
      body: Center(
      
        child: Column(
      
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
              Container(
              margin: const EdgeInsets.all(20),
              child:const Center(
              child: Image(
                height: 200,
                image: AssetImage(
                    'assets/images/music.png'),
              ),
              ),
            ),
           const SizedBox(height: 100,width: 200),
              // ignore: avoid_unnecessary_containers
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              
                children: [
                  Container(
                    width: 170,
                    height:40,
                   
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255,36, 72, 141),
                        elevation: 20,
                      
                        shadowColor: Colors.black,
                        shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                      ),
                     onPressed:  _incrementCounter
                      ,
                      child: const Text(
                        "CADASTRAR",
                        textDirection: TextDirection.ltr,
                        style:TextStyle(color: Colors.white,fontSize:15)
                        
                        ),
                    
                    ),
                    
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
