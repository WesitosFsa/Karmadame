import 'package:cochasqui_mitad_del_mundo/screens/main/main_screen.dart';
import 'package:cochasqui_mitad_del_mundo/screens/register_cochasqui_screen.dart';
import 'package:cochasqui_mitad_del_mundo/widgets/buttonR.dart';
import 'package:cochasqui_mitad_del_mundo/widgets/fonts_bold.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class LoginCochasquiScreen extends StatefulWidget {
  const LoginCochasquiScreen({super.key});


  @override
  State<LoginCochasquiScreen> createState() => _LoginCochasquiScreen();
}

class _LoginCochasquiScreen extends State<LoginCochasquiScreen> {
  late TextEditingController _passwordController;
  late TextEditingController _usernameController;
  String? _error;
  late bool _busy;

  @override
  void initState() {
    super.initState();

    _busy = false;
    _passwordController = TextEditingController(text: '');
    _usernameController = TextEditingController(text: '');
  }

  void _login(BuildContext context) async {
    setState(() {
      _busy = true;
      _error = null;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECEBE9),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Center(
                child: SizedBox(
                  width: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      text_bold(text: 'Registrate o accede como invitado',size: 16,),
                      const SizedBox(height: 35),
                      TextFormField(
                        controller: _usernameController,
                        decoration: const InputDecoration(labelText: "Correo Electronico"),
                        enabled: !_busy,
                        onFieldSubmitted: _busy
                            ? null
                            : (String value) {
                                _login(context);
                              },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration: InputDecoration(
                            labelText: "Contraseña", errorText: _error),
                        enabled: !_busy,
                        onFieldSubmitted: _busy
                            ? null
                            : (String value) {
                                _login(context);
                              },
                      ),
                      const SizedBox(height: 25),
                      ButtonR(
                          text: "Iniciar Sesion",
                          showIcon: false,
                            onTap: () {
                            
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const MainScreen()),
                            );
                       
                          }
                      ),
                                     const SizedBox(height: 25),
              
                      ButtonR(
                          text: "Registrarse",
                          showIcon: false,
                          onTap: () {
                            
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const RegisterCochasquiScreen()),
                            );
                       
                          }
               
                      ),
                                     const SizedBox(height: 25),
                      ButtonR(
                          text: "Acceder como invitado",
                          showIcon: false,
                      )
      
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
