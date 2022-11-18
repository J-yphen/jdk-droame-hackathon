import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:network_info_plus/network_info_plus.dart';
import 'dart:typed_data';
import 'package:permission_handler/permission_handler.dart';
 
class HomePage extends StatefulWidget {
  const HomePage({super.key});
 
  @override
  State<HomePage> createState() => _HomePageState();
}
 
class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final info = NetworkInfo();
  List<int> toIntList(Uint8List source) {
    return List.from(source);
  }
 
  Future<void> openSocket(_fileName, _filePath, wifiIP) async {
    final server = await ServerSocket.bind(wifiIP, 15232);
    server.listen((event) async {
      print("servering a file");
      await File(_filePath).openRead().pipe(event);
      server.close();
    });
  }
 
  Future<void> connectSocket(fileName, wifiIP, port) async {
    var socket = await Socket.connect(wifiIP, port);
    try {
      print("Connected to:"
          '${socket.remoteAddress.address}:${socket.remotePort}');
      socket.write('Send Data');
      var file = File(fileName).openWrite();
      try {
        await socket.map(toIntList).pipe(file);
      } finally {
        file.close();
      }
    } finally {
      socket.destroy();
    }
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome ${user.email!}!',
            ),
            MaterialButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              color: Colors.amber,
              child: Text('Sign out!'),
            ),
            FloatingActionButton(
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles();
                if (result == null) return;
                final file = result.files.first;
                print("Calling server...${InternetAddress.anyIPv4.address}");
                print(file.path);
                var wifiIP = await info.getWifiIP();
                openSocket(file.name, file.path, wifiIP);
              },
              heroTag: null,
              child: Icon(Icons.upload),
            ),
            FloatingActionButton(
              onPressed: () async {
                await Permission.storage.request();
                connectSocket("ExampleFileName", 'serverIP', 9999);
              },
              heroTag: null,
              child: Icon(Icons.download),
            ),
          ],
        ),
      ),
    );
  }
}
