import 'package:flutter/material.dart';

void main() {
  runApp(AppCrud());
}

class Produto {
  String nome;
  double preco;
  int quantidade;
  String categoria;

  Produto({
    required this.nome,
    required this.preco,
    required this.quantidade,
    required this.categoria,
  });

  double get valorTotal => preco * quantidade;
}

class AppCrud extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Compras',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Color.fromARGB(255, 21, 68, 179), // Set background color here
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'images/image.png',
                  height: 244,
                  width: 275,
                ),
              ],
            ),
            SizedBox(height: 20),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Usuário',
                labelStyle:
                    TextStyle(color: Colors.white), // Text color for label
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), // Border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blue), // Border color on focus
                ),
              ),
              style: TextStyle(color: Colors.white), // Text color for input
            ),
            SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle:
                    TextStyle(color: Colors.white), // Text color for label
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white), // Border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Colors.blue), // Border color on focus
                ),
              ),
              obscureText: true,
              style: TextStyle(color: Colors.white), // Text color for input
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_usernameController.text == 'macedo' &&
                    _passwordController.text == 'amoomacedo') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductListPage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('está errado meu amigo(a)')),
                  );
                }
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10),
            Text('Macedo Lovers:', style: TextStyle(color: Colors.white)),
            Text('DevSpolaor', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Produto> products = [
    Produto(
        nome: 'Arroz', preco: 100.0, quantidade: 2, categoria: 'Categoria 1'),
    Produto(
        nome: 'Batata', preco: 150.0, quantidade: 1, categoria: 'Categoria 2'),
    Produto(
        nome: 'Macedo', preco: 69.0, quantidade: 5, categoria: 'Categoria 3'),
    Produto(
        nome: 'Camiseta', preco: 77.0, quantidade: 3, categoria: 'Categoria 1'),
    Produto(
        nome: 'Frango Frito',
        preco: 57.0,
        quantidade: 4,
        categoria: 'Categoria 2'),
    Produto(
        nome: 'Cebola', preco: 40.0, quantidade: 2, categoria: 'Categoria 3'),
    Produto(
        nome: 'Alface', preco: 30.0, quantidade: 1, categoria: 'Categoria 1'),
    Produto(
        nome: 'chineses',
        preco: 11110.0,
        quantidade: 6,
        categoria: 'Categoria 2'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Compras', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 16, 130, 192),
        iconTheme: IconThemeData(color: Colors.white), // Olá Leandro
      ),
      backgroundColor: Color.fromARGB(255, 14, 130, 238),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(products[index].nome,
                    style: TextStyle(color: Colors.white)),
                subtitle: Text(
                  'Preço Unitário: \$${products[index].preco.toStringAsFixed(2)} | Quantidade: ${products[index].quantidade} | Categoria: ${products[index].categoria} | Valor Total: \$${products[index].valorTotal.toStringAsFixed(2)}',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.white),
                      onPressed: () async {
                        Produto updatedProduct = await showDialog(
                          context: context,
                          builder: (context) {
                            TextEditingController _nomeController =
                                TextEditingController(
                                    text: products[index].nome);
                            TextEditingController _precoController =
                                TextEditingController(
                                    text: products[index].preco.toString());
                            TextEditingController _quantidadeController =
                                TextEditingController(
                                    text:
                                        products[index].quantidade.toString());
                            TextEditingController _categoriaController =
                                TextEditingController(
                                    text: products[index].categoria);

                            return AlertDialog(
                              title: Text('Editar Produto'),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: _nomeController,
                                    decoration: InputDecoration(
                                      labelText: 'Nome',
                                      labelStyle: TextStyle(
                                          color: Colors
                                              .black), // Text color for label
                                    ),
                                    style: TextStyle(
                                        color: Colors
                                            .black), // Text color for input
                                  ),
                                  TextField(
                                    controller: _precoController,
                                    decoration: InputDecoration(
                                      labelText: 'Preço',
                                      labelStyle: TextStyle(
                                          color: Colors
                                              .black), // Text color for label
                                    ),
                                    keyboardType:
                                        TextInputType.numberWithOptions(
                                            decimal: true),
                                    style: TextStyle(
                                        color: Colors
                                            .black), // Text color for input
                                  ),
                                  TextField(
                                    controller: _quantidadeController,
                                    decoration: InputDecoration(
                                      labelText: 'Quantidade',
                                      labelStyle: TextStyle(
                                          color: Colors
                                              .black), // Text color for label
                                    ),
                                    keyboardType: TextInputType.number,
                                    style: TextStyle(
                                        color: Colors.black), // Amo o macedo
                                  ),
                                  TextField(
                                    controller: _categoriaController,
                                    decoration: InputDecoration(
                                      labelText: 'Categoria',
                                      labelStyle: TextStyle(
                                          color: Colors
                                              .black), // Text color for label
                                    ),
                                    style: TextStyle(
                                        color: Colors
                                            .black), // Text color for input
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Cancelar'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    if (_nomeController.text.isNotEmpty &&
                                        _precoController.text.isNotEmpty &&
                                        _quantidadeController.text.isNotEmpty &&
                                        _categoriaController.text.isNotEmpty) {
                                      Navigator.pop(
                                        context,
                                        Produto(
                                          nome: _nomeController.text.trim(),
                                          preco: double.parse(
                                              _precoController.text.trim()),
                                          quantidade: int.parse(
                                              _quantidadeController.text
                                                  .trim()),
                                          categoria:
                                              _categoriaController.text.trim(),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content:
                                                Text('Preencher corretamente')),
                                      );
                                    }
                                  },
                                  child: Text('Salvar'),
                                ),
                              ],
                            );
                          },
                        );

                        if (updatedProduct != null) {
                          products[index] = updatedProduct;
                          setState(() {});
                        }
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.white),
                      onPressed: () {
                        products.removeAt(index);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Produto removido')),
                        );
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
              Divider(color: Colors.white), // Add divider between items
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Produto newProduct = await showDialog(
            context: context,
            builder: (context) {
              TextEditingController _nomeController = TextEditingController();
              TextEditingController _precoController = TextEditingController();
              TextEditingController _quantidadeController =
                  TextEditingController();
              TextEditingController _categoriaController =
                  TextEditingController();

              return AlertDialog(
                title: Text('Novo Produto'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _nomeController,
                      decoration: InputDecoration(
                        labelText: 'Nome',
                        labelStyle: TextStyle(
                            color: Colors.black), // Text color for label
                      ),
                      style: TextStyle(
                          color: Colors.black), // Text color for input
                    ),
                    TextField(
                      controller: _precoController,
                      decoration: InputDecoration(
                        labelText: 'Preço',
                        labelStyle: TextStyle(
                            color: Colors.black), // Text color for label
                      ),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(
                          color: Colors.black), // Text color for input
                    ),
                    TextField(
                      controller: _quantidadeController,
                      decoration: InputDecoration(
                        labelText: 'Quantidade',
                        labelStyle: TextStyle(
                            color: Colors.black), // Text color for label
                      ),
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          color: Colors.black), // Text color for input
                    ),
                    TextField(
                      controller: _categoriaController,
                      decoration: InputDecoration(
                        labelText: 'Categoria',
                        labelStyle: TextStyle(
                            color: Colors.black), // Text color for label
                      ),
                      style: TextStyle(
                          color: Colors.black), // Text color for input
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancelar'),
                  ),
                  TextButton(
                    onPressed: () {
                      if (_nomeController.text.isNotEmpty &&
                          _precoController.text.isNotEmpty &&
                          _quantidadeController.text.isNotEmpty &&
                          _categoriaController.text.isNotEmpty) {
                        Navigator.pop(
                          context,
                          Produto(
                            nome: _nomeController.text.trim(),
                            preco: double.parse(_precoController.text.trim()),
                            quantidade:
                                int.parse(_quantidadeController.text.trim()),
                            categoria: _categoriaController.text.trim(),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('preencha certo meu amigo(a)')),
                        );
                      }
                    },
                    child: Text('Adicionar'),
                  ),
                ],
              );
            },
          );

          if (newProduct != null) {
            products.add(newProduct);
            setState(() {});
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
