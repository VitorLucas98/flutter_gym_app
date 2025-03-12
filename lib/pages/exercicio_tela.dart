import 'package:flutter/material.dart';
import 'package:flutter_gym_app/common/minhas_cores.dart';
import 'package:flutter_gym_app/models/exercico_model.dart';
import 'package:flutter_gym_app/models/sentimento_model.dart';

class ExercicioTela extends StatelessWidget {
  ExercicioTela({super.key});

  final ExcercicioModel excercicioModel = ExcercicioModel(
    id: "1",
    name: "Remada Baixa Supinada",
    treino: "Treino A",
    comoFazer: "Segura a barra e puxa",
  );

  final List<SentimentoModel> listaSentimentos = [
    SentimentoModel(
      id: "1",
      sentindo: "Estou me sentindo bem, mas um pouco cansado.",
      data: "2025-02-22",
    ),
    SentimentoModel(
      id: "2",
      sentindo: "Estou me sentindo FORTÃO, pegou muito bem.",
      data: "2025-01-10",
    ),
    SentimentoModel(
      id: "3",
      sentindo: "Estou me sentindo fraco, acho que estou doente.",
      data: "2024-10-10",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              excercicioModel.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(excercicioModel.treino, style: const TextStyle(fontSize: 15)),
          ],
        ),
        centerTitle: true,
        backgroundColor: MinhasCores.azulEscuro,
        elevation: 0,
        toolbarHeight: 72,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print("Botão de adicionar exercício clicado");
                    },
                    child: const Text("Enviar foto!"),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Tirar Foto!"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Como fazer?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(excercicioModel.comoFazer),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(color: Colors.black),
            ),
            const SizedBox(height: 8),
            const Text(
              "Como estou me sentindo?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(listaSentimentos.length, (index) {
                SentimentoModel sentimentoNow = listaSentimentos[index];
                return ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  title: Text(sentimentoNow.sentindo),
                  subtitle: Text(sentimentoNow.data),
                  leading: const Icon(Icons.double_arrow),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      print("Botão de deletar clicado");
                    },
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
