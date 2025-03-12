import 'package:flutter/material.dart';
import 'package:flutter_gym_app/services/autenticacao_servico.dart';

class TelaInicial extends StatelessWidget {
  const TelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tela Inicial'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Deslogar'),
              onTap: () {
                AutenticacaoServico().deslogarUsuario();
              },
            ),
          ],
        ),
      ),
    );
  }
}