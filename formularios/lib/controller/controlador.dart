import 'package:formularios/models/persona.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormularioReactivoController {
  final FormGroup tarjetasCredito = FormGroup({
    'nombre': FormControl<String>(validators: [Validators.required], value: ""),
    'numeroTarjeta': FormControl<String>(validators: [
      Validators.required,
      Validators.minLength(1),
      Validators.maxLength(16)
    ], value: ""),
  });

  String get getNombre => tarjetasCredito.control('nombre').value;
  String get getNumero => tarjetasCredito.control('numeroTarjeta').value;
  void cleanForm() {
    tarjetasCredito.control('nombre').value = "";
    tarjetasCredito.control('numeroTarjeta').value = "";
  }

  final FormGroup listaTarjetasCredito =
      FormGroup({'tarjetasCredito': FormArray<Persona>([])});

  FormArray<Persona> get obtenerTarjetas =>
      listaTarjetasCredito.control('tarjetasCredito') as FormArray<Persona>;

  void agregarTarjeta(Persona numero) {
    obtenerTarjetas.add(FormControl<Persona>(value: numero));
  }

  void remove(Persona numero, int indice) {
    FormArray<Persona> formArray = obtenerTarjetas;
    // formArray.controls.asMap().forEach((key, value) {
    // String numeroAux =
    //(value as FormControl<Persona>).value!.numero.toString();
    //if (numero.numero == numeroAux) {
    print("Si son iguales" + indice.toString());
    // obtenerTarjetas.remove(FormControl<Persona>(value: numero));
    obtenerTarjetas.removeAt(indice);
    // }
    //  });
  }

  List<Persona> creditCards() {
    List<Persona> creditCards = [];
    FormArray<Persona> formArray = obtenerTarjetas;
    formArray.controls.asMap().forEach((key, value) {
      creditCards.add((value as FormControl<Persona>).value!);
      //print("dfdfd" + (value as FormControl<Persona>).value.toString());
    });

    return creditCards;
  }
}

final controller = FormularioReactivoController();
