import 'package:flutter/material.dart';
import 'planejamento_consumo_screen.dart';
import 'diagnostico_screen.dart';
import 'simulacao_screen.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F1E9), 
      appBar: AppBar(
        title: Text('Eficiência Energética'),
        backgroundColor: Color(0xFFF8F1E9), 
        elevation: 0, 
        automaticallyImplyLeading: false, 
        iconTheme: IconThemeData(color: Color(0xFF8D7966)), 
        titleTextStyle: TextStyle(
          color: Color(0xFF8D7966),
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlanejamentoConsumoScreen()),
                  );
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
                child: Text('Planejamento de Consumo', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 20), 
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DiagnosticoScreen()),
                  );
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
                child: Text('Diagnóstico de Eletrodomésticos', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SimulacaoScreen()),
                  );
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
                child: Text('Simulação de Cenários', style: TextStyle(color: Colors.white)),
              ),
              SizedBox(height: 40), 
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
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
                child: Text('Logout', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
