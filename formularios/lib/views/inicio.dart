import 'package:flutter/material.dart';
import 'package:formularios/controller/controlador.dart';
import 'package:formularios/models/persona.dart';
import 'package:formularios/widgets/formulario.dart';
import 'package:formularios/widgets/listadoTarjetas.dart';
import 'package:formularios/widgets/tarjeta.dart';
import 'package:reactive_forms/reactive_forms.dart';

class Formulario extends StatelessWidget {
  const Formulario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Formularios Reactivos")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text("Ingreso de datos ahora:"),
            ReactiveForm(
              formGroup: controller.tarjetasCredito,
              child: Column(children: [
                InputsForm(
                  nombreInput: 'nombre',
                  keboard: TextInputType.text,
                ),
                InputsForm(
                  nombreInput: 'numeroTarjeta',
                  keboard: TextInputType.number,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (!controller.tarjetasCredito.valid) {
                        print("no es válido");
                      } else {
                        Persona persona = Persona();
                        persona.nombre = controller.getNombre;
                        persona.numero = controller.getNumero;
                        controller.agregarTarjeta(persona);
                        controller.cleanForm();
                        print("ddd; " + controller.creditCards().toString());
                      }
                    },
                    child: const Text("Agregar Tarjeta")),
              ]),
            ),
            StreamBuilder(
              stream: controller.tarjetasCredito.valueChanges,
              builder: (context, snapshot) {
                return TarjetaCredito(
                  nombreUsuario: controller.getNombre,
                  numeroTarjeta: controller.getNumero,
                );
              },
            ),
            const Text(
              "Listado de Clientes",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            StreamBuilder(
                stream: controller.listaTarjetasCredito.valueChanges,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListadoClientes(lista: controller.creditCards());
                  } else {
                    return Container(
                      child: const Text("No hay data"),
                    );
                  }
                })
          ],
        ),
      ),
    );
  }
}
