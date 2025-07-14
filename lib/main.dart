import 'dart:io';

// Classe Pessoa
class Pessoa {
  String nome;
  double peso; // em kg
  double altura; // em metros

  Pessoa(this.nome, this.peso, this.altura);

  double calcularIMC() {
    if (altura <= 0) {
      throw Exception('Altura deve ser maior que zero para calcular o IMC.');
    }
    return peso / (altura * altura);
  }
}

void main() {
  try {
    stdout.write('Digite seu nome: ');
    String? nome = stdin.readLineSync();
    if (nome == null || nome.trim().isEmpty) {
      throw Exception('Nome não pode estar vazio.');
    }

    stdout.write('Digite seu peso em kg (ex: 70.5): ');
    String? pesoInput = stdin.readLineSync();
    double peso = double.tryParse(pesoInput ?? '') ?? -1;
    if (peso <= 0) {
      throw Exception('Peso deve ser maior que zero.');
    }

    stdout.write('Digite sua altura em metros (ex: 1.75): ');
    String? alturaInput = stdin.readLineSync();
    double altura = double.tryParse(alturaInput ?? '') ?? -1;
    if (altura <= 0) {
      throw Exception('Altura deve ser maior que zero.');
    }

    Pessoa pessoa = Pessoa(nome.trim(), peso, altura);
    double imc = pessoa.calcularIMC();

    print('\nResultado:');
    print('IMC de ${pessoa.nome}: ${imc.toStringAsFixed(2)}');
    print(
      'Dados informados - Peso: ${pessoa.peso} kg, Altura: ${pessoa.altura} m',
    );
  } catch (e) {
    print('Erro: $e');
  }
}
