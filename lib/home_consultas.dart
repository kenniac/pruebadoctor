import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pruebadoctor/consultas.dart';
import 'package:pruebadoctor/pages/call.dart';

class ConsultasScreen extends StatelessWidget {
  final List<Consulta> consultas;

  ConsultasScreen({required this.consultas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultas Agendadas'),
      ),
      body: Column(
        children: <Widget>[
          // Parte superior de la pantalla
          Expanded(
            child: ListView.builder(
              itemCount: consultas.length,
              itemBuilder: (context, index) {
                final consulta = consultas[index];
                return ListTile(
                  title: Text('Paciente: ${consulta.paciente}'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CallPage(consulta: consulta),
                      ));
 
        
                     };

                      // Lógica para iniciar la videollamada aquí
                    },
                    child: Text('Iniciar Videollamada'),
                  ),
                  onTap: () {
                    // Navegar a la pantalla de detalles de la consulta al tocar la consulta
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetallesConsultaScreen(consulta: consulta),
                    ));
                  },
                );
              },
            ),
          ),
          // Parte inferior de la pantalla (historial de llamadas)
          Container(
            padding: EdgeInsets.all(16.0), // Añade espacio alrededor del contenido
            decoration: BoxDecoration(
              border: Border.all(), // Añade un borde alrededor del contenedor
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center, // Centra el contenido
              children: <Widget>[
                Text(
                  'Historial',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16), // Espacio entre el encabezado y la lista
                Container(
                  height: 200, // Ajusta la altura según tus necesidades
                  child: ListView.builder(
                    itemCount: 10, // Cantidad de elementos en tu historial de llamadas
                    itemBuilder: (context, index) {
                      // Puedes construir elementos del historial de llamadas aquí
                      return ListTile(
                        title: Text('Llamada $index'),
                      );
                    },
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

class DetallesConsultaScreen extends StatelessWidget {
  final Consulta consulta;

  DetallesConsultaScreen({required this.consulta});

  @override
  Widget build(BuildContext context) {
    final formattedDateTime = DateTime(consulta.fecha.year, consulta.fecha.month, consulta.fecha.day, consulta.hora.hour, consulta.hora.minute);
    final formattedDate = DateFormat('dd/MM/yyyy').format(formattedDateTime);
    final formattedTime = DateFormat('HH:mm').format(formattedDateTime);

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la Consulta'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Paciente: ${consulta.paciente}'),
            Text('Fecha: $formattedDate'),
            Text('Hora: $formattedTime'),
            Text('Motivo: ${consulta.motivo}'),
          ],
        ),
      ),
    );
  }
}
