import 'package:flutter/material.dart';
import 'package:almacen_online/models/productos.dart';
import 'package:almacen_online/services/product_service.dart';
import 'package:almacen_online/widgets/product_card.dart';
import 'package:provider/provider.dart';
import 'package:almacen_online/screen/screen.dart';

class ListProductScreen extends StatelessWidget {
  const ListProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductService>(context);
    if (productService.isLoading) return LoadingScreen();
    return Scaffold(
    
      body: 
      ListView.builder(
        itemCount: productService.products.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            productService.SelectProduct =
                productService.products[index].copy();
            Navigator.pushNamed(context, 'edit');
          },
          child: ProductCard(product: productService.products[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          productService.SelectProduct = Listado(
              productId: 0,
              productName: '',
              productPrice: 0,
              productImage:
                  'https://abravidro.org.br/wp-content/uploads/2015/04/sem-imagem4.jpg',
              productState: '');
          Navigator.pushNamed(context, 'edit');
        },
      ),
    );
  }
}
