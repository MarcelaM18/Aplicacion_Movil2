import 'package:flutter/material.dart';
import 'package:navegacion/presentation/screens/usuario_registration_screen.dart';
import 'package:navegacion/presentation/widgets/menu_appbar.dart';

import '../../datos/usuario_list.dart';
import '../widgets/passwordField.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var username = '';
  var password = '';

  void _login(BuildContext context) {
    username = _usernameController.text;
    password = _passwordController.text;

    bool isAuthenticated = usuarios.any((usuario) =>
        usuario.nombreUsuario == username &&
        usuario.contrasena == password);

    if (isAuthenticated) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Inicio de sesión exitoso'),
          backgroundColor: Colors.green,
        ),
      );

      Future.delayed(const Duration(seconds: 1), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Home()),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Usuario o Contraseña incorrectas'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MenuAppbar(centerTitle: true, showMenu: false),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center, // Centrar verticalmente
            children: <Widget>[
              const Text(
                'Inicio Sesion',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(labelText: 'Nombre de usuario'),
              ),
              PasswordField(
                controller: _passwordController,
                labelText: 'Contraseña',
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    username = '';
                    password = '';
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UsuarioRegistrationScreen()),
                  );
                },
                child: const Text(
                  'No tienes Cuenta? Regístrate',
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  String username = _usernameController.text;
                  String password = _passwordController.text;

                  if (username.isNotEmpty && password.isNotEmpty) {
                    _login(context);
                    setState(() {
                      _usernameController.clear();
                      _passwordController.clear();
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Por favor, complete todos los campos.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                ),
                child: const Text('Iniciar sesión', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
