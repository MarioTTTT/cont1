
import 'package:flutter/material.dart';
import 'package:hello/main.dart';
import 'package:hello/widgets/name_conf.dart';
import '../colors/colors_theme.dart';
import 'name_conf.dart';
class BodyConfi extends StatelessWidget {
  const BodyConfi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body:Padding( padding: EdgeInsets.only(top:10) ,


      child:  SingleChildScrollView(
         scrollDirection: Axis.vertical,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Padding(
                    padding: EdgeInsets.all(30), 
                    child: Text(
                      
                     'Configurações',
                          style: TextStyle(
                      fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                     ), 
                           ),
                   
                    

                  ),
                  ConfigSCreen(
                           iconData: Icons.lock,
                           labelText: 'Privacidade',
                           onPressed: () {}
                  ),
                  SizedBox(height: 16,),
                  ConfigSCreen(
                           iconData: Icons.account_circle_sharp,
                           labelText: 'Perfil',
                           onPressed: () {}
                  ),
                  SizedBox(height: 16,),
                  ConfigSCreen(
                           iconData: Icons.note,
                           labelText: 'Informações',
                             onPressed: () {}
                  ),
                  SizedBox(height: 16,),
                  ConfigSCreen(
                           iconData: Icons.logout,
                           labelText: 'Sair',
                             onPressed: () {
                                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomePage()));
                                    },
                  ),


        ],
     
      ),
           
      )
      
      )
    );
  }
}