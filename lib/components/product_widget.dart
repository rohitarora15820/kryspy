import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/categoryController.dart';
import '../controller/productController.dart';


class ProductWidget extends ConsumerStatefulWidget {
  const ProductWidget({super.key});

  @override
  ConsumerState<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends ConsumerState<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    final productsData=ref.watch(getProductsProvider);
    return productsData.when(data: (data){

      return  GridView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(2),
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
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2 / 3));
    }, error: (error, stackTrace) => Text(error.toString()), loading: () => Center(
      child: CircularProgressIndicator(),
    ),);
  }
}
