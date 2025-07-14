class Pessoa {
  String nome;
  double peso;
  double altura;

  Pessoa(this.nome, this.peso, this.altura);

  double calcularIMC() {
    if (altura <= 0) {
      throw Exception('Altura deve ser maior que zero para calcular o IMC.');
    }
    return peso / (altura * altura);
  }
}
