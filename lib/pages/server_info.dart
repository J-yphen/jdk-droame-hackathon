import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ServerInfoPage extends StatefulWidget {

  final wifiIP;
  final port;

  const ServerInfoPage({super.key, required this.wifiIP, required this.port});

  @override
  State<ServerInfoPage> createState() => _ServerInfoPageState();
}

class _ServerInfoPageState extends State<ServerInfoPage> {
  
  @override
  Widget build(BuildContext context) => Scaffold(
        
        appBar: AppBar(
          backgroundColor: Colors.amber,
          elevation: 0,
          title: Text('Send a file!'),
        ),
        body: SafeArea(
          child: Center(
            child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      'Here are the server details!',
                      style: GoogleFonts.rubik(
                        fontSize: 20,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      widget.wifiIP.toString(),
                      style: GoogleFonts.rubik(
                        fontSize: 20,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text(
                      widget.port.toString(),
                      style: GoogleFonts.rubik(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
          ),
        ),
      );
}