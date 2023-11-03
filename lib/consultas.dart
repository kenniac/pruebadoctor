

  import 'package:flutter/material.dart';

  class Consulta {
  final String paciente;
  final DateTime fecha;
  final TimeOfDay hora;
  final String motivo;

  Consulta(this.paciente, this.fecha, this.hora, this.motivo);
}

List<Consulta> consultasAgendadas = [
  Consulta("Manuel Rodríguez", DateTime(2023, 10, 30, 10, 0), TimeOfDay(hour: 10, minute: 0), "Control de presión"),
  Consulta("Ana Martinez", DateTime(2023, 10, 30, 11, 30), TimeOfDay(hour: 11, minute: 30), "Chequeo general"),
  // Agrega más consultas aquí
];

