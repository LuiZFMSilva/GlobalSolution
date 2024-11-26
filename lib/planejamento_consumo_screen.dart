import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlanejamentoConsumoScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController horariosController = TextEditingController();
  final TextEditingController moradoresController = TextEditingController();
  final TextEditingController frequenciaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F1E9), 
      appBar: AppBar(
        title: Text('Planejamento de Consumo'),
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
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                'Preencha o questionário sobre seus hábitos',
                style: TextStyle(
                  color: Color(0xFF8D7966), 
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: horariosController,
                cursorColor: Color(0xFF8D7966), 
                decoration: InputDecoration(
                  labelText: 'Horas de Uso',
                  labelStyle: TextStyle(color: Color(0xFFA8A39D)), 
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFA8A39D)), 
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFA8A39D)), 
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, 
                  LengthLimitingTextInputFormatter(2), 
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, preencha este campo';
                  }
                  return null;
                },
                style: TextStyle(color: Color(0xFF8D7966)), 
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: moradoresController,
                cursorColor: Color(0xFF8D7966), 
                decoration: InputDecoration(
                  labelText: 'Número de moradores',
                  labelStyle: TextStyle(color: Color(0xFFA8A39D)), 
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFA8A39D)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFA8A39D)), 
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly, 
                  LengthLimitingTextInputFormatter(2), 
                ],
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, preencha este campo';
                  }
                  return null;
                },
                style: TextStyle(color: Color(0xFF8D7966)), 
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: frequenciaController,
                cursorColor: Color(0xFF8D7966), 
                decoration: InputDecoration(
                  labelText: 'Frequência de uso de equipamentos',
                  labelStyle: TextStyle(color: Color(0xFFA8A39D)), 
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFA8A39D)), 
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFA8A39D)), 
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, preencha este campo';
                  }
                  return null;
                },
                style: TextStyle(color: Color(0xFF8D7966)), 
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    String horarios = horariosController.text;
                    String moradores = moradoresController.text;
                    String frequencia = frequenciaController.text;

                    print('Horários: $horarios, Moradores: $moradores, Frequência: $frequencia');

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Formulário enviado com sucesso!'))
                    );

                    horariosController.clear();
                    moradoresController.clear();
                    frequenciaController.clear();
                  }
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
                child: Text('Enviar', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
