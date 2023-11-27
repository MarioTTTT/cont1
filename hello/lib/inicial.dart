import 'package:flutter/material.dart';
import 'package:hello/perfil.dart';
import 'package:hello/widgets/body_home.dart';
import 'package:hello/widgets/confi.dart';
import 'package:hello/widgets/favorites.dart';
import 'package:hello/widgets/screenSearch.dart';

import 'colors/colors_theme.dart';


class Inicial extends StatefulWidget {
  const Inicial({super.key});

  @override
  State<Inicial> createState() => _InicialState();
}

class _InicialState extends State<Inicial> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    const BodyInicial(),
    const BodyConfi (),
     const Favorites(),
    const SearchScreen(),
    // Adicione mais telas aqui conforme necessário
  ];


  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      
    backgroundColor:const Color.fromARGB(255, 4,18,46),
    appBar: AppBar(
       backgroundColor: const Color.fromARGB(255,36, 72, 141),
      
       title: const Text('ColdMusic'),

       leading: IconButton(
                                          icon: const Icon(
                                           Icons.account_circle_sharp,
                                            size: 30,
                                            color: Colors.white,
                                                                            ), 
                                                                            
                                          onPressed: () {  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const PerfilScreen()));
                        },
                                        ),
       
      ),
         
    
    
           
    
  body: _screens[_selectedIndex],
      floatingActionButton: ClipOval(
        child: FloatingActionButton(
          onPressed: () {
            // Lógica para o botão flutuante
          },
          backgroundColor: AppColors.secondaryColor,
          foregroundColor: Colors.white,
          child: const Icon(Icons.add),
            
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        
        color: const Color.fromARGB(255, 36, 72, 141),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceAround,


          children: [
            IconButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              },
              icon: const Icon(Icons.home),
              color: _selectedIndex == 0 ? Colors.white : const Color.fromARGB(255, 5, 35, 91),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
              },
              icon: const Icon(Icons.settings),
              color: _selectedIndex == 1 ? Colors.white : const Color.fromARGB(255, 5, 35, 91),
            ),
              IconButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                });
              },
              icon: const Icon(Icons.favorite),
              color: _selectedIndex ==2 ? Colors.white : const Color.fromARGB(255, 5, 35, 91),
            ),
              IconButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 3;
                });
              },
              icon: const Icon(Icons.search),
              color: _selectedIndex == 3 ? Colors.white : const Color.fromARGB(255, 5, 35, 91),
            ),// Adicione mais IconButton conforme necessário
          ],
        ),
      ),
      
    );
  }
 
}

   
