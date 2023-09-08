import 'package:flutter/material.dart';
import 'package:navegacion/dominio/models/usuario.dart';

import '../../datos/usuario_list.dart';
import '../widgets/menu_appbar.dart';
import '../widgets/passwordField.dart';

class UsuarioRegistrationScreen extends StatefulWidget {
  const UsuarioRegistrationScreen({Key? key}) : super(key: key);

  @override
  _UsuarioRegistrationScreenState createState() => _UsuarioRegistrationScreenState();
}

class _UsuarioRegistrationScreenState extends State<UsuarioRegistrationScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _registerUser(BuildContext context) {
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    Usuario newUser = Usuario(
      nombreUsuario: username,
      correo: email,
      contrasena: password,
    );

    usuarios.add(newUser);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Registro exitoso'),
        backgroundColor: Colors.green,
      ),
    );

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MenuAppbar(centerTitle: true, showMenu: false),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Registro de Usuario',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(labelText: 'Nombre de usuario'),
                ),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Correo'),
                ),
                PasswordField(
                  controller: _passwordController,
                  labelText: 'Contraseña',
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_usernameController.text.isNotEmpty && _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
                      _registerUser(context);
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
                    // ignore: deprecated_member_use
                    primary: Colors.green,
                    // ignore: deprecated_member_use
                    onPrimary: Colors.white,
                  ),
                  child: const Text('Registrar', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
