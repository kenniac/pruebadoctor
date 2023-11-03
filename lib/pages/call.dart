import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';



class CallPage extends StatefulWidget {
  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  final _appId = 'a446a2d4e16f4202b37a121f43cdcca0'; // Reemplaza con tu App ID de Agora
  final _channelName = 'canal-de-prueba';

  late RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  Future<void> initAgora() async {
    await [Permission.microphone, Permission.camera].request();

    _engine = await RtcEngine.create(_appId);
    await _engine.enableVideo();
  }

  @override
  void dispose() {
    _engine.destroy();
    super.dispose();
  }

  _joinChannel() async {
    await _engine.joinChannel(null, _channelName, null, 0, token: '007eJxTYJjGZrOk9H9kVErnZ5b59vMVBZ9NuNrGtMedU+NuMusenzcKDIkmJmaJRikmqYZmaSZGBkZJxuaJhkaGaSbGySnJyYkGVl+cUhsCGRmstWWYGRkgEMTnYHDOzysuzSlJZGAAAEyRHto=');
  }

  _leaveChannel() async {
    await _engine.leaveChannel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Videollamada Agora'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 300,
              height: 300,
              child: AgoraView(
                mode: ViewMode.Fit,
                remoteUid: 0,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _joinChannel,
              child: Text('Unirse a la videollamada'),
            ),
            ElevatedButton(
              onPressed: _leaveChannel,
              child: Text('Salir de la videollamada'),
            ),
          ],
        ),
      ),
    );
  }
}
