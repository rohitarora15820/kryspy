import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controller/productController.dart';
import '../model/product_model.dart';

class SearchProducts extends SearchDelegate{
  final WidgetRef ref;
  SearchProducts(this.ref);
  
  @override
  List<Widget>? buildActions(BuildContext context) {
return [
  IconButton(onPressed: (){
    query="";
  }, icon: const Icon(Icons.search))
];
  }

  @override
  Widget? buildLeading(BuildContext context) {
   return null;
  }

  @override
  Widget buildResults(BuildContext context) {
   final productsData=ref.watch(searchProvider(query));
   return productsData.when(
      data: (data) {
        return GridView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(2),
                child: GestureDetector(
                  onTap: () {
                    ProductModel model = ProductModel(
                      name: data[index].name ?? "",
                      categoryName: data[index].categoryName ?? "",
                      description: data[index].description??"",
                      image: data[index].image??"",
                      isAvailable: data[index].isAvailable??false,
                      oldPrice: data[index].oldPrice??0.0,
                      price: data[index].price??0.0,
                      productId: data[index].productId??"",
                    );
                    GoRouter.of(context).pushNamed(
                      'productDetail',
                      extra: model,
                      // queryParameters: {'product': data[index]},
                    );
                  },
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Image.network(
                            data[index].image!,
                            fit: BoxFit.fitHeight,
                            height: 150,
                          ),
                          Center(
                            child: Text(
                              data[index].name!,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${data[index].oldPrice}",
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "\$${data[index].price}",
                                style: const TextStyle(
                                    color: Colors.deepOrangeAccent,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 2 / 3));
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
  final productsData=ref.watch(searchProvider(query));
   return productsData.when(
      data: (data) {
        return GridView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(2),
                child: GestureDetector(
                  onTap: () {
                    ProductModel model = ProductModel(
                      name: data[index].name ?? "",
                      categoryName: data[index].categoryName ?? "",
                      description: data[index].description??"",
                      image: data[index].image??"",
                      isAvailable: data[index].isAvailable??false,
                      oldPrice: data[index].oldPrice??0.0,
                      price: data[index].price??0.0,
                      productId: data[index].productId??"",
                    );
                    GoRouter.of(context).pushNamed(
                      'productDetail',
                      extra: model,
                      // queryParameters: {'product': data[index]},
                    );
                  },
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Image.network(
                            data[index].image!,
                            fit: BoxFit.fitHeight,
                            height: 150,
                          ),
                          Center(
                            child: Text(
                              data[index].name!,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${data[index].oldPrice}",
                                style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18,
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "\$${data[index].price}",
                                style: const TextStyle(
                                    color: Colors.deepOrangeAccent,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 2 / 3));
      },
      error: (error, stackTrace) => Text(error.toString()),
      loading: () => Center(
        child: CircularProgressIndicator(),
      ),
    );
 
  }
  
}