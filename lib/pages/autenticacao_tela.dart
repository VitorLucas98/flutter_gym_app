import 'package:flutter/material.dart';
import 'package:flutter_gym_app/common/meu_snackbar.dart';
import 'package:flutter_gym_app/common/minhas_cores.dart';
import 'package:flutter_gym_app/components/decoracao_campo_auth.dart';
import 'package:flutter_gym_app/services/autenticacao_servico.dart';

class AutenticacaoTela extends StatefulWidget {
  const AutenticacaoTela({super.key});

  @override
  State<AutenticacaoTela> createState() => _AutenticacaoTelaState();
}

class _AutenticacaoTelaState extends State<AutenticacaoTela> {
  bool queroEntrar = true;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _nomeController = TextEditingController();

  AutenticacaoServico _authService = AutenticacaoServico();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  MinhasCores.azulTopoGradiente,
                  MinhasCores.azulBaixoGradiente,
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset('assets/images/logo.png', height: 128),
                      const Text(
                        "Gym App",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 32),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: getCampoAuthDecorado("E-mail"),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'O e-mail não pode ser vazio';
                          }
                          if (!value.contains('@')) {
                            return 'O e-mail deve conter um @';
                          }
                          if (value.length < 5) {
                            return 'O e-mail deve ter no mínimo 5 caracteres';
                          }
                        },
                      ),
                      SizedBox(height: 8),
                      TextFormField(
                        controller: _senhaController,
                        decoration: getCampoAuthDecorado("Senha"),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'A senha não pode ser vazia';
                          }
                          if (value.length < 6) {
                            return 'O  senha deve ter no mínimo 6 caracteres';
                          }
                        },
                        obscureText: true,
                      ),
                      Visibility(
                        visible: !queroEntrar,
                        child: Column(
                          children: [
                            SizedBox(height: 8),
                            TextFormField(
                              keyboardType: TextInputType.name,
                              controller: _nomeController,
                              decoration: getCampoAuthDecorado("Nome"),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'O nome não pode ser vazio';
                                }
                                if (value.length < 3) {
                                  return 'O nome deve ter no mínimo 3 caracteres';
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          botaoClicado();
                        },
                        child: Text((queroEntrar) ? 'Entrar' : 'Cadastrar'),
                      ),
                      Divider(),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            queroEntrar = !queroEntrar;
                          });
                        },
                        child: Text(
                          (queroEntrar)
                              ? "Ainda não tem uma conta? Cadastre-se!"
                              : "Já tem uma conta? Entre!",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  botaoClicado() {
    String nome = _nomeController.text;
    String email = _emailController.text;
    String senha = _senhaController.text;

    if (_formKey.currentState!.validate()) {
      if (queroEntrar) {
        _authService.logarUsuario(email: email, senha: senha).then((String? erro) {
          if (erro != null) {
            mostrarSnackbar(context: context, texto: erro);
          } else {
            mostrarSnackbar(context: context, texto: "Usuário logado com sucesso", isErro: false);
          }
        });
      } else {
        print("Cadastrar");
        print("E-mail: ${email}, Senha: ${senha}, Nome: ${nome}");
        _authService.cadastrarUsuario(
          email: email,
          senha: senha,
          nome: nome,
        ).then((String? erro) {
          if (erro != null) {
            mostrarSnackbar(context: context, texto: erro);
          } else {
            mostrarSnackbar(context: context, texto: "Usuário cadastrado com sucesso", isErro: false);
          }
        });
      }
    } else {
      print("Formulário inválido");
    }
  }
}
