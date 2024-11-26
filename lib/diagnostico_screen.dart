import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DiagnosticoScreen extends StatefulWidget {
  @override
  _DiagnosticoScreenState createState() => _DiagnosticoScreenState();
}

class _DiagnosticoScreenState extends State<DiagnosticoScreen> {
  final TextEditingController chuveiroController = TextEditingController();
  final TextEditingController geladeiraController = TextEditingController();
  
  String chuveiroStatus = '';
  String geladeiraStatus = '';

  void _limparCampos() {
    chuveiroController.clear();
    geladeiraController.clear();
    setState(() {
      chuveiroStatus = '';
      geladeiraStatus = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F1E9), 
      appBar: AppBar(
        title: Text('Diagnóstico de Eletrodomésticos'),
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
            Text(
              'Insira os dados de uso dos dispositivos',
              style: TextStyle(
                color: Color(0xFF8D7966), 
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: chuveiroController,
              cursorColor: Color(0xFF8D7966), 
              decoration: InputDecoration(
                labelText: 'Chuveiro (minutos por dia)',
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
                LengthLimitingTextInputFormatter(4), 
              ],
              style: TextStyle(color: Color(0xFF8D7966)), 
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: geladeiraController,
              cursorColor: Color(0xFF8D7966), 
              decoration: InputDecoration(
                labelText: 'Geladeira (horas por dia)',
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
                double chuveiroConsumo = double.tryParse(chuveiroController.text) ?? 0.0;
                double geladeiraConsumo = double.tryParse(geladeiraController.text) ?? 0.0;

                setState(() {
                  if (chuveiroConsumo > 60) {
                    chuveiroStatus = 'Consumo acima do esperado';
                  } else {
                    chuveiroStatus = 'Consumo dentro do esperado';
                  }

                  if (geladeiraConsumo > 10) {
                    geladeiraStatus = 'Consumo acima do esperado';
                  } else {
                    geladeiraStatus = 'Consumo dentro do esperado';
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
              child: Text('Calcular Consumo', style: TextStyle(color: Colors.white)),
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
            if (geladeiraStatus.isNotEmpty)
              ListTile(
                leading: Icon(Icons.warning, color: Color(0xFF8D7966)),
                title: Text('Geladeira'),
                subtitle: Text(geladeiraStatus),
                trailing: geladeiraStatus == 'Consumo acima do esperado'
                    ? Text('Ineficiente', style: TextStyle(color: Colors.red))
                    : Text('Eficiente', style: TextStyle(color: Colors.green)),
              ),
            if (chuveiroStatus.isNotEmpty)
              ListTile(
                leading: Icon(Icons.check_circle, color: Color(0xFF8D7966)),
                title: Text('Chuveiro'),
                subtitle: Text(chuveiroStatus),
                trailing: chuveiroStatus == 'Consumo acima do esperado'
                    ? Text('Ineficiente', style: TextStyle(color: Colors.red))
                    : Text('Eficiente', style: TextStyle(color: Colors.green)),
              ),
          ],
        ),
      ),
    );
  }
}
