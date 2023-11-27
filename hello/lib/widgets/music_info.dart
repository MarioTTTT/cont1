import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hello/colors/colors_theme.dart';

class MusicInfo extends StatelessWidget {
  const MusicInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      
      children: [
           Image.asset(
            'assets/images/emi.png',
            width:250),
            const SizedBox(height: 30,),
           Text('Lose YourSelf',
            style: TextStyle(fontSize: 20),
           
           ),
          const SizedBox(height: 30,),
           Text('Eminem',
            style: TextStyle(fontSize: 16,
            color:AppColors.textun 
            ),
           
           )
      ],);
  }
}