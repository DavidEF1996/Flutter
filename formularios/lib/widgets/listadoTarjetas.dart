import 'package:flutter/material.dart';
import 'package:formularios/controller/controlador.dart';
import 'package:formularios/models/persona.dart';

// ignore: must_be_immutable
class ListadoClientes extends StatefulWidget {
  List<Persona> lista;
  ListadoClientes({Key? key, required this.lista}) : super(key: key);

  @override
  State<ListadoClientes> createState() => _ListadoClientesState();
}

class _ListadoClientesState extends State<ListadoClientes> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.creditCards().length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        String nombre = controller.creditCards()[index].nombre;
        String credicard = controller.creditCards()[index].numero;
        return Padding(
          padding: EdgeInsets.only(left: 5),
          child: Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Row(children: [
                  Icon(Icons.person),
                  SizedBox(
                    width: 20,
                  ),
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Text("Nombre: " + nombre),
                    SizedBox(
                      width: 10,
                    ),
                    Text("Tarjeta: " + credicard)
                  ])
                ]),
              ),
              IconButton(
                  onPressed: () {
                    Persona p = new Persona();
                    p.nombre = controller.creditCards()[index].nombre;
                    p.numero = controller.creditCards()[index].numero;
                    controller.remove(p, index);

                    print("Ahora el objeto tiene:" +
                        controller.creditCards().length.toString());
                  },
                  icon: Icon(Icons.delete))
            ],
          ),
        );
      },
    );
  }
}
