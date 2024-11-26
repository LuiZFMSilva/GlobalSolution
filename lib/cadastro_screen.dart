import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'user_data.dart';

class CadastroScreen extends StatefulWidget {
  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmarSenhaController = TextEditingController();

  String? _nomeError;
  String? _emailError;
  String? _senhaError;
  String? _confirmarSenhaError;

  bool _senhaVisivel = false;
  bool _confirmarSenhaVisivel = false;

  bool _isEmailValid(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  bool _isSenhaValid(String senha) {
    final senhaRegex = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{5,}$');
    return senhaRegex.hasMatch(senha);
  }

  bool _isNomeValid(String nome) {
    final nomes = nome.split(' ');
    return nomes.length >= 2;
  }

  String _capitalizeWords(String text) {
    if (text.isEmpty) return text;
    return text.split(' ').map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      }
      return word;
    }).join(' ');
  }

  void _validateFields() {
    setState(() {
      _nomeError = !_isNomeValid(nomeController.text) ? 'Nome e sobrenome são obrigatórios' : null;
      _emailError = !_isEmailValid(emailController.text) ? 'Email inválido' : null;
      _senhaError = !_isSenhaValid(senhaController.text) ? 'A senha deve conter 1 letra maiúscula, 1 número, 1 caracter especial e no mínimo 5 caracteres' : null;
      _confirmarSenhaError = senhaController.text != confirmarSenhaController.text ? 'As senhas não coincidem' : null;
    });
  }

  void _submitForm() {
    _validateFields();
    if (_nomeError == null && _emailError == null && _senhaError == null && _confirmarSenhaError == null) {
      userData.nome = nomeController.text;
      userData.login = emailController.text;
      userData.senha = senhaController.text;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F1E9), 
      appBar: AppBar(
        title: Text('Cadastro de Paciente'),
        backgroundColor: Color(0xFFF8F1E9), 
        elevation: 0, 
        iconTheme: IconThemeData(color: Color(0xFF8D7966)), 
        titleTextStyle: TextStyle(
          color: Color(0xFF8D7966),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: nomeController,
              cursorColor: Color(0xFF8D7966), 
              decoration: InputDecoration(
                labelText: 'Nome',
                labelStyle: TextStyle(color: Color(0xFFA8A39D)), 
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFA8A39D)), 
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFA8A39D)), 
                ),
                errorText: _nomeError, 
              ),
              style: TextStyle(color: Color(0xFF8D7966)), 
              onChanged: (value) {
                nomeController.value = nomeController.value.copyWith(
                  text: _capitalizeWords(value),
                  selection: TextSelection.collapsed(offset: value.length),
                );
              },
            ),
            SizedBox(height: 20),
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
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Tooltip(
                      message: 'A senha deve conter 1 Letra Maiúscula, 1 Número, 1 Caracter Especial e no mínimo 5 caracteres',
                      child: Icon(Icons.info_outline, color: Color(0xFFA8A39D)),
                    ),
                    IconButton(
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
                  ],
                ),
              ),
              obscureText: !_senhaVisivel,
              style: TextStyle(color: Color(0xFF8D7966)), 
            ),
            SizedBox(height: 20),
            TextField(
              controller: confirmarSenhaController,
              cursorColor: Color(0xFF8D7966), 
              decoration: InputDecoration(
                labelText: 'Confirmar Senha',
                labelStyle: TextStyle(color: Color(0xFFA8A39D)), 
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFA8A39D)), 
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFA8A39D)), 
                ),
                errorText: _confirmarSenhaError, 
                suffixIcon: IconButton(
                  icon: Icon(
                    _confirmarSenhaVisivel ? Icons.visibility : Icons.visibility_off,
                    color: Color(0xFFA8A39D),
                  ),
                  onPressed: () {
                    setState(() {
                      _confirmarSenhaVisivel = !_confirmarSenhaVisivel;
                    });
                  },
                ),
              ),
              obscureText: !_confirmarSenhaVisivel,
              style: TextStyle(color: Color(0xFF8D7966)), 
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8D7966), 
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              child: Text('Cadastrar', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
