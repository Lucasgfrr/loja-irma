import 'dart:math';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:missangas/animacao/rot.dart';
import 'package:missangas/detalhes/quartoDeCirculo.dart';
import 'package:missangas/pages/Compras&Vendas/pageVendas.dart';
import 'package:missangas/pages/Compras&Vendas/pageCompras.dart';
import 'package:flutter_any_logo/flutter_logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showLogin = true;
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String userType = 'consumer'; // Padrão para consumidor

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "   B e m  V i n d o ",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                        const Text(
                          "   A o  A P P ",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                        const SizedBox(
                          height: 150,
                        ),
                        Transform.rotate(
                          angle: 3.14 / 2,
                          child: ClipPath(
                            clipper: QuarterCircleClipper(),
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        Transform.rotate(
                          angle: 3.14,
                          child: ClipPath(
                            clipper: QuarterCircleClipper(),
                            child: Container(
                              width: 100,
                              height: 100,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Transform.rotate(
                      angle: -3.14 / 2,
                      child: ClipPath(
                        clipper: QuarterCircleClipper(),
                        child: Container(
                          width: 200,
                          height: 200,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ToggleButtons(
                isSelected: [showLogin, !showLogin],
                onPressed: (index) {
                  setState(() {
                    showLogin = index == 0;
                  });
                },
                borderRadius: BorderRadius.circular(10),
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Login"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Cadastro"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Stack(
                alignment: Alignment.center,
                children: [
                  const SizedBox(height: 200),
                  Positioned(
                    child: AnimatedSwitcher(
                      duration: const Duration(seconds: 1),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        final rotate =
                            Tween(begin: pi, end: 0.0).animate(animation);
                        return RotationYTransition(turns: rotate, child: child);
                      },
                      child: showLogin ? _buildLoginForm() : _buildSignupForm(),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Creator"
                " L u c a s g f r r ",
                style: TextStyle(
                  color: Color.fromARGB(90, 163, 163, 163),
                ),
              ),
              AnyLogo.media.instagram.image(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Container(
      key: const ValueKey(1),
      width: 400,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.purple, width: 1),
      ),
      padding: const EdgeInsets.fromLTRB(15, 10, 5, 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward, color: Colors.purple),
              onPressed: () {
                _login();
              },
            ),
          ),
          const Spacer(),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: "Email",
              labelStyle: TextStyle(color: Colors.purple),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
            ),
            style: const TextStyle(color: Colors.purple),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _senhaController,
            decoration: const InputDecoration(
              labelText: "Senha",
              labelStyle: TextStyle(color: Colors.purple),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
            ),
            style: const TextStyle(color: Colors.purple),
            obscureText: true,
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(4),
              child: const Text(
                "PRINCES MIÇANGAS",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupForm() {
    return Container(
      key: const ValueKey(2),
      width: 400,
      height: 400,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.purple, width: 1),
      ),
      padding: const EdgeInsets.fromLTRB(15, 10, 5, 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward, color: Colors.purple),
              onPressed: () {
                _register();
              },
            ),
          ),
          const Spacer(),
          TextField(
            controller: _nomeController,
            decoration: const InputDecoration(
              labelText: "Nome",
              labelStyle: TextStyle(color: Colors.purple),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
            ),
            style: const TextStyle(color: Colors.purple),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: "Email",
              labelStyle: TextStyle(color: Colors.purple),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
            ),
            style: const TextStyle(color: Colors.purple),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _senhaController,
            decoration: const InputDecoration(
              labelText: "Senha",
              labelStyle: TextStyle(color: Colors.purple),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.purple),
              ),
            ),
            style: const TextStyle(color: Colors.purple),
            obscureText: true,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Radio<String>(
                value: 'seller',
                groupValue: userType,
                onChanged: (value) {
                  setState(() {
                    userType = value!;
                  });
                },
              ),
              const Text("Vendedor"),
              Radio<String>(
                value: 'consumer',
                groupValue: userType,
                onChanged: (value) {
                  setState(() {
                    userType = value!;
                  });
                },
              ),
              const Text("Cliente"),
            ],
          ),
        ],
      ),
    );
  }

  void _login() async {
    String email = _emailController.text;
    String senha = _senhaController.text;

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );

      // Verifique se o usuário está logado
      if (userCredential.user != null) {
        // Redirecionar para a tela apropriada com base no tipo de usuário
        _navigateBasedOnUserType(userCredential.user!);
      }
    } catch (e) {
      // Se o usuário não está cadastrado ou credenciais inválidas, mostre uma mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("FAÇA UMA CONTA EM CADASTRAR"),
        padding: EdgeInsets.all(10),
        backgroundColor: Colors.red,
      ));
    }
  }

  void _navigateBasedOnUserType(User user) async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (userDoc.exists) {
      String userType = userDoc.get('userType');
      if (userType == 'seller') {
        // Se o usuário for um vendedor, redireciona para a página de vendedor
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SellerProductPage(), // Página do vendedor
          ),
        );
      } else {
        // Se o usuário for um consumidor, redireciona para a página de produtos
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ConsumerProductPage(), // Página do consumidor
          ),
        );
      }
    }
  }

  void _register() async {
    String nome = _nomeController.text;
    String email = _emailController.text;
    String senha = _senhaController.text;

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );

      // Verifique se o usuário foi cadastrado
      if (userCredential.user != null) {
        // Salve informações adicionais no Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set({
          'name': nome,
          'email': email,
          'userType': userType, // 'seller' ou 'consumer'
        });

        // Redirecionar para a tela apropriada com base no tipo de usuário
        _navigateBasedOnUserType(userCredential.user!);
      }
    } catch (e) {
      // Se houver um erro durante o cadastro, mostre uma mensagem de erro
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("EMAIL JA REGISTRADO, VA PARA O LOGIN"),
        ),
      );
    }
  }
}
