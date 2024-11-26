import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'cadastro_screen.dart';
import 'user_data.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  String? _emailError;
  String? _senhaError;

  bool _senhaVisivel = false;

  bool _isEmailValid(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  bool _isSenhaValid(String senha) {
    return senha.length > 5;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F1E9), 
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bem-vindo ao Smart Energy!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
                color: Color(0xFF8D7966), 
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50), 
            TextField(
              controller: emailController,
              cursorColor: Color(0xFF8D7966), 
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Color(0xFFA8A39D)), 
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFA8A39D)), 
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFA8A39D)), 
                ),
                errorText: _emailError, 
              ),
              style: TextStyle(color: Color(0xFF8D7966)), 
            ),
            SizedBox(height: 20), 
            TextField(
              controller: senhaController,
              cursorColor: Color(0xFF8D7966), 
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(color: Color(0xFFA8A39D)), 
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFA8A39D)), 
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFA8A39D)), 
                ),
                errorText: _senhaError, 
                suffixIcon: IconButton(
                  icon: Icon(
                    _senhaVisivel ? Icons.visibility : Icons.visibility_off,
                    color: Color(0xFFA8A39D),
                  ),
                  onPressed: () {
                    setState(() {
                      _senhaVisivel = !_senhaVisivel;
                    });
                  },
                ),
              ),
              obscureText: !_senhaVisivel,
              style: TextStyle(color: Color(0xFF8D7966)), 
            ),
            SizedBox(height: 30), 
            ElevatedButton(
              onPressed: () {
                setState(() {
                  if (_isEmailValid(emailController.text) && _isSenhaValid(senhaController.text)) {
                    _emailError = null;
                    _senhaError = null;
                    if (emailController.text == userData.login && senhaController.text == userData.senha) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Email ou senha incorretos!')),
                      );
                    }
                  } else {
                    _emailError = !_isEmailValid(emailController.text) ? 'Email inválido' : null;
                    _senhaError = !_isSenhaValid(senhaController.text) ? 'Senha inválida' : null;
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8D7966), 
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              child: Text('Entrar', style: TextStyle(color: Colors.white)),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CadastroScreen()),
                );
              },
              child: Text('Criar uma conta'),
              style: TextButton.styleFrom(
                foregroundColor: Color(0xFF8D7966), 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
