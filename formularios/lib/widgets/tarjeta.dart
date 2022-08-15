import 'package:flutter/material.dart';

class TarjetaCredito extends StatefulWidget {
  String numeroTarjeta;
  String nombreUsuario;
  TarjetaCredito(
      {Key? key, required this.numeroTarjeta, required this.nombreUsuario})
      : super(key: key);

  @override
  State<TarjetaCredito> createState() => _TarjetaCreditoState();
}

class _TarjetaCreditoState extends State<TarjetaCredito> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Title(
                    color: Colors.white,
                    child: const Text(
                      "Tarjeta Banco del Austro",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                const Icon(
                  Icons.card_giftcard,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                devolver(widget.numeroTarjeta) ?? "xxxx xxxx xxxx xxxx",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.nombreUsuario ?? "Nombre",
                  style: TextStyle(color: Colors.white),
                ),
                Text("${DateTime.now().month}/${DateTime.now().day}",
                    style: TextStyle(color: Colors.white))
              ],
            ),
          )
        ]),
      ),
    );
  }

  String devolver(String numero) {
    String enviar = "";
    for (var i = 0; i < numero.length; i++) {
      if (i < 10) {
        if (i % 4 == 0) {
          enviar += " x";
        } else {
          enviar += "x";
        }
      } else if (i > 10) {
        if (i % 4 == 0) {
          enviar += " x";
        }
        enviar += '${numero[i]}';
      }
    }
    return enviar;
  }
}
