
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:hello/services/autentica_service.dart';
import 'package:hello/services/friends.dart';

import '../colors/colors_theme.dart';

class PlayCard extends StatefulWidget {
 final String labelText;
 final String image;
  final VoidCallback? onUpdateScreen;
 final Widget proximaTela;
  const PlayCard({
    Key? key,
    
    required this.labelText, required this.image,required this.proximaTela,this.onUpdateScreen,
  }) : super(key: key);



  @override
  State<PlayCard> createState() => _PlayCardState();
}

class _PlayCardState extends State<PlayCard> {


  String? userId;


  @override
  void initState() {
    super.initState();
    _updateUserId();
  }

  @override
  void dispose() {
    super.dispose();
    // Faça a limpeza necessária se houver algo para limpar
  }

  Future<void> _updateUserId() async {
    final user = AutenticacaoServico().getUidUsuarioAtual();
    if (mounted) {
      setState(() {
        userId = user;
      });
    }
  }

  Future<void> _removerAmigo() async {
    if (userId != null) {
        print('Amigo não encontrado.');
      await AmigosService().removerAmigoPorNome(userId!, widget.labelText);
      _updateUserId(); // Atualize o userId após a remoção
      if (widget.onUpdateScreen != null && mounted) {
        widget.onUpdateScreen!();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return   Padding(
        padding: const EdgeInsets.all(20.0),
                    child: Row(
                                     children: [
                                      GestureDetector(
                                        onTap: () {
    // Navega para a tela definida pela variável
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      // Use aqui a variável que contém a tela para onde você quer navegar
                                  return widget.proximaTela;
                                  }));
                                    },
                                            child: Container(
                                      padding: EdgeInsets.all(5.0),
                                        child:  CircleAvatar(
                                          radius: 45,
                                          backgroundImage:widget.image.isNotEmpty
                                              ? AssetImage(widget.image)
                                                : const AssetImage('assets/images/peguim.png'),
                                           
                                    ),
                                         ),
                                    ),
                                     Container(
                                     
                                      
                                      padding: EdgeInsets.all(15),
                                       child: SizedBox(
                                        width: 90,
                                        height: 30,
                                         child:  widget.labelText.isNotEmpty
                                     ? Text(
                                     widget.labelText,
                             style: TextStyle(
                            fontSize: 20,
                               fontWeight: FontWeight.bold,
                                 color: Colors.white,
                             ),
                                   )
                                    : Placeholder(
                                      color: Colors.grey, // Cor do placeholder
                                  fallbackWidth: 90,
                                 fallbackHeight: 30,
                                 ),
                                       ),
                                     ),



                                             Container(
                                            
                                               child: IconButton(
                                                 icon: Icon(
                                                  Icons.heart_broken,
                                                   size: 30,
                                                    color: Colors.white,
                                                                            
                                                    ), 
                                                                              
                                          onPressed: () async {
                                                if (userId != null) {
                                                print('Música deletada');
                                                  showDialog(
                                                    context: context,
                                                    builder: (_) => AlertDialog(
                                                      backgroundColor: AppColors.primaryColor,
                                                      title: Text('Sucesso', style: TextStyle(color: Colors.white)),
                                                      content: Text(' Amigo Excluido', style: TextStyle(color: Colors.white)),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () {
                                                            Navigator.pop(context);

                                                            _removerAmigo();
                                                          },
                                                          child: Text('OK', style: TextStyle(color: Colors.white)),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }
                                              },
                                                                                     ),
                                             ),

                                     ],
                                   ),

       
    );



  
  }
}