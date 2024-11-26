import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SimulacaoScreen extends StatefulWidget {
  @override
  _SimulacaoScreenState createState() => _SimulacaoScreenState();
}

class _SimulacaoScreenState extends State<SimulacaoScreen> {
  final TextEditingController lampadaController = TextEditingController();
  final TextEditingController arCondicionadoController = TextEditingController();

  String economiaMensal = '';
  String impactoAmbiental = '';

  void _limparCampos() {
    lampadaController.clear();
    arCondicionadoController.clear();
    setState(() {
      economiaMensal = '';
      impactoAmbiental = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F1E9), 
      appBar: AppBar(
        title: Text('Simulação de Cenários'),
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
            Text('Crie uma simulação de consumo',
              style: TextStyle(
                color: Color(0xFF8D7966),
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: lampadaController,
              cursorColor: Color(0xFF8D7966), 
              decoration: InputDecoration(
                labelText: 'Troca de lâmpada incandescente por LED (quantidade)',
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
                LengthLimitingTextInputFormatter(3), 
              ],
              style: TextStyle(color: Color(0xFF8D7966)), 
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: arCondicionadoController,
              cursorColor: Color(0xFF8D7966), 
              decoration: InputDecoration(
                labelText: 'Redução do uso do ar-condicionado (horas por dia)',
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
              style: TextStyle(color: Color(0xFF8D7966)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int quantidadeLampadas = int.tryParse(lampadaController.text) ?? 0;
                double horasArCondicionado = double.tryParse(arCondicionadoController.text) ?? 0.0;

                double economiaPorLampada = 5.0;
                double economiaPorHoraAr = 3.0;  

                double economiaTotal = (quantidadeLampadas * economiaPorLampada) + (horasArCondicionado * economiaPorHoraAr);
                double impactoTotal = (quantidadeLampadas * 2.0) + (horasArCondicionado * 1.5); 

                setState(() {
                  economiaMensal = 'R\$ ${economiaTotal.toStringAsFixed(2)}/mês';
                  impactoAmbiental = 'Redução de ${impactoTotal.toStringAsFixed(0)} kg de CO2 por mês';
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
              child: Text('Calcular Economia', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _limparCampos,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF8D7966),
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              child: Text('Limpar Campos', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.savings, color: Color(0xFF8D7966)),
              title: Text('Economia Potencial'),
              subtitle: Text(economiaMensal.isEmpty ? 'R\$ 0,00/mês' : economiaMensal),
            ),
            ListTile(
              leading: Icon(Icons.nature, color: Color(0xFF8D7966)),
              title: Text('Redução no Impacto Ambiental'),
              subtitle: Text(impactoAmbiental.isEmpty ? '0 kg de CO2 por mês' : impactoAmbiental),
            ),
          ],
        ),
      ),
    );
  }
}
