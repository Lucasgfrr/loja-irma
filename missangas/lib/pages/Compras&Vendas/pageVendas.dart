// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SellerProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seus Produtos'),
      ),
      body: ListView(
        children: const [
          // Lista de produtos aqui
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Ação para adicionar um novo produto
        },
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add),
      ),
    );
  }
}
