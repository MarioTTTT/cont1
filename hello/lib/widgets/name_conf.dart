
import 'package:flutter/material.dart';
import '../colors/colors_theme.dart';

class ConfigSCreen extends StatelessWidget {
   final IconData iconData;
  final String labelText;
 final void Function()? onPressed;

  const ConfigSCreen({
    Key? key,
    required this.iconData,
    required this.labelText,
      required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
                                           child: Row(
                                             children: [
                                               IconButton(
                                                 icon: Icon(
                                                 iconData,
                                                  size: 20,
                                                  color: Colors.white,
                                                                                   ), 
                                                 onPressed: () {
                                                      if (onPressed != null) {
                                                           onPressed!();
                                                         }
                                                        },
                                               ),
                                            
                                           
                                            Text(
                            
                                        labelText,
                                        style: TextStyle(
                                      fontSize: 15,
                                   fontWeight: FontWeight.bold,
                                       color: Colors.white,
                           ), 
                              
                        ),
    
                                           
    
    
                                             ],
                                           ),
                                      
    
    
                                
    
    
          ),
        ],
      ),
    );
  }
}