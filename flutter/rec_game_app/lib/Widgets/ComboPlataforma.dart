import 'package:flutter/material.dart';
import 'package:rec_game_app/Service/PlataformaService.dart' as serv;
import 'package:rec_game_app/models/plataforma.dart';

class ComboPlataformas extends StatefulWidget {
  const ComboPlataformas({Key? key}) : super(key: key);

  @override
  State<ComboPlataformas> createState() => _ComboPlataformasState();
}

class _ComboPlataformasState extends State<ComboPlataformas> {
  String dropdownValue = 'One';
  List<Plataforma> plat = serv.listarPlataforma as List<Plataforma>;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>[
        'One',
        'Two',
        'Free',
        'Four'
      ] // aqui precisa de uma lista dos nomes das plataformas
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
