import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kryspy/model/product_model.dart';

class ProductDetailPage extends ConsumerStatefulWidget {
  final ProductModel productModel;
  const ProductDetailPage({super.key, required this.productModel});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductDetailPageState();
}

class _ProductDetailPageState extends ConsumerState<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const    SizedBox(height: 50,),

              Stack(
                children: [
                  Image.network(widget.productModel.image!,
                      height: 250, width: double.infinity, fit: BoxFit.cover),
                  Positioned(
                      top: 10,
                      left: 10,
                      child: GestureDetector(
                        onTap: () {
                          GoRouter.of(context).pop();
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 25,
                          color: Colors.white,
                        ),
                      )),
                  const Positioned(
                      top: 10,
                      right: 60,
                      child: Icon(
                        Icons.shopping_bag,
                        size: 25,
                        color: Colors.white,
                      )),
                  const Positioned(
                      top: 10,
                      right: 10,
                      child: Icon(
                        Icons.favorite,
                        size: 25,
                        color: Colors.white,
                      ))
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  widget.productModel.name!,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 25,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.productModel.description!,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
              ,

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${widget.productModel.price}',
                      style: const TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                     Text(
                      '\$${widget.productModel.oldPrice}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.lineThrough
                          ),
                    ),
              
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(child: Text("Add to Cart"),
                    onPressed: (){},
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
