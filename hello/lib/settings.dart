import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hello/perfil.dart';

class MySettings extends StatelessWidget {
  const MySettings({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(


        home: Settings(),
    );
  }
}



class Settings extends StatefulWidget {
  const Settings({super.key});


//função pra chamar o state inicial 
  @override
  State<Settings> createState() => _SettingsState();
}




//state inicial
class _SettingsState extends State<Settings> {
  //@override
 // Widget build(BuildContext context) {
    // TODO: implement build
   // throw UnimplementedError();
  //}
 int _counter = 0;


  
  @override
  Widget build(BuildContext context) {
      int _selectedIndex = 2; 
    // TODO: implement build
    return Scaffold(
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
                                                                            
                                          onPressed: () {  Navigator.push(
                                                         context,
                                                 MaterialPageRoute(builder: (context) => PerfilScreen()),
                                                                   ); },
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
          },
          items:[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
            BottomNavigationBarItem(icon: Icon(Icons.settings),  label: "Settings"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          ],
        ),
      ),
    ),
  ),
),
floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


    );
  }
  }
