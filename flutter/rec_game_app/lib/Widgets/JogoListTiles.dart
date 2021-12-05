import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:rec_game_app/models/Jogo.dart';

import 'package:rec_game_app/Service/GeneroService.dart' as generoService;
import 'package:rec_game_app/Service/PlataformaService.dart' as plataformaService;
import 'package:rec_game_app/models/genero.dart';
import 'package:rec_game_app/models/plataforma.dart';

class JogoListTile extends StatelessWidget {
  final List<Jogo> jog;

  const JogoListTile(this.jog);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        mainAxisExtent: 300,
        childAspectRatio: 1,
        crossAxisSpacing: 0.1,
        mainAxisSpacing: 1
      ),
      itemCount: jog.length,
      itemBuilder: (ctx, i) => Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              jog[i].descricao,
              textAlign: TextAlign.center,
            )
          ),
          Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: InkWell(
              onTap: () async {
                await showDialog(
                  context: context,
                  builder: (_) => JogoDetail(jogo: jog[i])
                );
              },
              hoverColor: Colors.black26,
              child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [ 
                    Ink.image(
                      image: NetworkImage(jog[i].avatar),
                      height: 240,
                      fit: BoxFit.fill,
                    ),
                  ]
                )
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
            ),
            elevation: 5,
            margin: EdgeInsets.only(left: 20, right: 20),
              ),
        ],
      )
      
      );
  }
}

class JogoDetail extends StatefulWidget {
  final Jogo jogo;
  JogoDetail({required this.jogo});

  @override
  State<StatefulWidget> createState() => new JogoDetailState(jogo:jogo);
}

class JogoDetailState extends State<JogoDetail> with SingleTickerProviderStateMixin {
  final Jogo jogo;
  JogoDetailState({required this.jogo});
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  Plataforma jogoPlat = Plataforma(id: 0, descricao: "", dataCadastro: "", avatar: "");
  List<String> generosDesc = [];
  List<Plataforma> listPlat = [];
  List<Genero> listGen = [];

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      listGen = await generoService.listarGenero;
      listPlat = await plataformaService.listarPlataforma;
      jogoPlat = listPlat.where((element) => element.id == jogo.plataforma).first;
      jogo.generos.forEach((jogGen) {
        generosDesc.add(listGen.where((element) => element.id == jogGen).first.descricao);
      });
    });

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
            insetPadding: EdgeInsets.symmetric(horizontal: 100),
            elevation: 5,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.65,
              height: MediaQuery.of(context).size.height * 0.8,
              padding: EdgeInsets.only(bottom: 20),
              child: new LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Container(
                          height: constraints.maxHeight,
                          width: constraints.maxWidth,
                          child: Column(
                            children: [
                              Container(
                                height: constraints.maxHeight * 0.85,
                                width: constraints.maxWidth,
                                child: new LayoutBuilder(
                                  builder: (BuildContext context, BoxConstraints boxSuperior) {
                                    return Row(
                                      children: [ 
                                        Padding(
                                          padding: EdgeInsets.only(top: 25, left: 20, right: 5), 
                                          child: Row(
                                            children: [
                                              Container(
                                                width: (boxSuperior.maxWidth / 2) - 20,
                                                height: boxSuperior.maxHeight,
                                                child: new LayoutBuilder(
                                                  builder: (BuildContext context, BoxConstraints boxEsquerda) {
                                                      return Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsets.only(bottom: 20),
                                                            child: Text(
                                                                    jogo.descricao, 
                                                                    textAlign: TextAlign.left,
                                                                    style: TextStyle(
                                                                            fontWeight: FontWeight.w800, 
                                                                            color: Colors.black87,
                                                                            fontSize: 24,
                                                                            letterSpacing: 1.5,
                                                                            shadows: [
                                                                              Shadow(
                                                                                  blurRadius: 2.0,
                                                                                  color: Colors.black54,
                                                                                  offset: Offset(1.0, 1.0),
                                                                                  ),
                                                                            ],
                                                                          ),
                                                                  )
                                                          ),
                                                          Container(
                                                              width: boxEsquerda.maxWidth,
                                                              height: (boxEsquerda.maxHeight - 20) * 0.90,
                                                              decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                                                  image: DecorationImage(
                                                                    image: NetworkImage(jogo.avatar),
                                                                    fit: BoxFit.fill
                                                                  ),
                                                              )
                                                          ),
                                                        ]
                                                      );
                                                  }
                                                )
                                              ),
                                              Container(
                                                width: (constraints.maxWidth / 2) - 15,
                                                height: constraints.maxHeight,
                                                alignment: Alignment.topCenter,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets.only(top: 100,left: 15),
                                                      alignment: Alignment.centerLeft,
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                              width: 125,
                                                              height: 90,
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape.circle,
                                                                  image: DecorationImage(
                                                                    image: NetworkImage(jogo.avatar),
                                                                    fit: BoxFit.contain
                                                                  ),
                                                              )
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets.only(left: 10),
                                                            child: Text(
                                                                    jogoPlat.descricao,
                                                                    textAlign: TextAlign.left,
                                                                    style: TextStyle(
                                                                            fontWeight: FontWeight.w800, 
                                                                            color: Colors.black87,
                                                                            fontSize: 16,
                                                                            letterSpacing: 1.5,
                                                                            shadows: [
                                                                              Shadow(
                                                                                  blurRadius: 2.0,
                                                                                  color: Colors.black54,
                                                                                  offset: Offset(1.0, 1.0),
                                                                                  ),
                                                                            ],
                                                                          ),
                                                                  )
                                                          )
                                                        ],
                                                      )
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(top: 30,left: 15),
                                                      alignment: Alignment.centerLeft,
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                              width: 125,
                                                              height: 90,
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape.circle,
                                                                  image: DecorationImage(
                                                                    image: NetworkImage(jogo.avatar),
                                                                    fit: BoxFit.contain
                                                                  ),
                                                              )
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets.only(left: 10),
                                                            child: Text(
                                                                      generosDesc.join(', '),
                                                                      textAlign: TextAlign.left,
                                                                      style: TextStyle(
                                                                              fontWeight: FontWeight.w800, 
                                                                              color: Colors.black87,
                                                                              fontSize: 16,
                                                                              letterSpacing: 1.5,
                                                                              shadows: [
                                                                                Shadow(
                                                                                    blurRadius: 2.0,
                                                                                    color: Colors.black54,
                                                                                    offset: Offset(1.0, 1.0),
                                                                                    ),
                                                                              ],
                                                                            ),
                                                                    )
                                                          )
                                                        ],
                                                      )
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(top: 90),
                                                      child: Text(
                                                        "ID ( " +jogo.id.toString() + " )  " + jogo.dataCadastro,
                                                        textAlign: TextAlign.left,
                                                        style: TextStyle(
                                                          fontWeight: FontWeight.w800,
                                                          color: Colors.black87,
                                                          fontSize: 14,
                                                          letterSpacing: 1.0,
                                                          shadows: [
                                                            Shadow(
                                                              blurRadius: 2.0,
                                                              color: Colors.black54,
                                                              offset: Offset(1.0,1.0)
                                                            )
                                                          ]
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                )
                                              )
                                            ],
                                          ) 
                                        )
                                      ]);
                                    }
                                  ),
                              ),
                              Container(
                                height: constraints.maxHeight * 0.15,
                                width: constraints.maxWidth,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ButtonBar(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 100),
                                          child: SizedBox.fromSize(
                                            size: Size(76, 70),
                                            child: ClipOval(
                                              child: Material(
                                                color: Colors.black12,
                                                child: InkWell(
                                                  onTap: () {}, 
                                                  child: Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Icon(Icons.edit),
                                                      Text("Editar"),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        ),
                                        SizedBox.fromSize(
                                          size: Size(76, 70),
                                          child: ClipOval(
                                            child: Material(
                                              color: Colors.black12,
                                              child: InkWell(
                                                onTap: () {},
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Icon(Icons.delete), 
                                                    Text("Excluir"),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              )
                            ],
                          )
                         );
                }  
              )
          )
          );
  }
}
