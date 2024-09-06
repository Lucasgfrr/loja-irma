import 'package:flutter/material.dart';
import 'package:missangas/detalhes/quartoDeCirculo.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          " B e m  V i n d o ",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          " A o  A P P ",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Spacer(), // Empurra o quarto de círculo para a direita
                    Transform.rotate(
                      angle:
                          -3.14 / 2, // Ângulo de rotação em radianos (90 graus)
                      child: ClipPath(
                        clipper: QuarterCircleClipper(),
                        child: Container(
                          width: 200, // Ajuste o tamanho conforme necessário
                          height: 200,
                          color: Colors.blue, // Cor do quarto de círculo
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 150,
              ),
              Stack(
                children: [
                  Container(
                    width: 400,
                    height: 550,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 206, 206, 206),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
