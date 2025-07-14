import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const IMCPage(),
    );
  }
}

class IMCPage extends StatefulWidget {
  const IMCPage({super.key});

  @override
  State<IMCPage> createState() => _IMCPageState();
}

class _IMCPageState extends State<IMCPage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();

  String resultado = "";

  void calcularIMC() {
    final String nome = nomeController.text.trim();
    final double? peso = double.tryParse(pesoController.text);
    final double? altura = double.tryParse(alturaController.text);

    if (nome.isEmpty || peso == null || altura == null || altura <= 0) {
      setState(() {
        resultado = "Por favor, preencha todos os campos corretamente.";
      });
      return;
    }

    double imc = peso / (altura * altura);

    setState(() {
      resultado =
          "IMC de $nome: ${imc.toStringAsFixed(2)}\nPeso: $peso kg, Altura: $altura m";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculadora de IMC")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: "Nome"),
            ),
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Peso (kg)"),
            ),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Altura (m)"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularIMC,
              child: const Text("Calcular IMC"),
            ),
            const SizedBox(height: 20),
            Text(
              resultado,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
