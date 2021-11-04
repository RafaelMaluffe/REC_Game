import 'dart:html';

import 'package:flutter/material.dart';
import 'package:rec_game_app/models/Jogo.dart';

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
                      fit: BoxFit.cover,
                    ),
                    /*ButtonBar(
                    alignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Perform some action
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: CircleBorder(),
                          fixedSize: Size.fromRadius(18),
                          elevation: 6
                        ),
                        child: Icon(
                          Icons.border_color_outlined,
                          color: Colors.black87,
                        ) //const Text('ACTION 1', style: TextStyle(color: Colors.black)),
                      ),
                      TextButton(
                        onPressed: () {
                          // Perform some action
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: CircleBorder(),
                          fixedSize: Size.fromRadius(18),
                          elevation: 6
                        ),
                        child: Icon(
                          Icons.delete,
                          color: Colors.black87,
                        )//const Text('ACTION 2', style: TextStyle(color: Colors.black)),
                      ),
                      ]
                    )*/
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

  @override
  void initState() {
    super.initState();

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
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [ 
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(jogo.avatar),
                          fit: BoxFit.fill
                        ),
                    )
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(jogo.descricao, textAlign: TextAlign.center)
                    )
                  ],
                )
                  ])
          )
          );
  }
}
