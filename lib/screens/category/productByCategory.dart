import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kryspy/controller/productController.dart';

import '../../model/product_model.dart';

class ProductByCategory extends ConsumerStatefulWidget {
  final String categoryName;
  const ProductByCategory({super.key, required this.categoryName});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductByCategoryState();
}

class _ProductByCategoryState extends ConsumerState<ProductByCategory> {
  @override
  Widget build(BuildContext context) {
    final productsData =
        ref.watch(getProductsByCaregoryProvider(widget.categoryName));
    return Scaffold(
        appBar: AppBar(
          elevation: 5,
          leading: IconButton(onPressed: (){
            GoRouter.of(context).pop();
          }, icon: const Icon(Icons.arrow_back_ios)),
          title: Text(widget.categoryName,style: TextStyle(
            fontSize: 22.sp,
            color: Colors.black,
            fontWeight: FontWeight.w500
          ),),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: productsData.when(
          data: (data) {
            return data.isEmpty
                ? const Center(
                    child: Text("No products found under this category"),
                  )
                : GridView.builder(
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
                              description: data[index].description ?? "",
                              image: data[index].image ?? "",
                              isAvailable: data[index].isAvailable ?? false,
                              oldPrice: data[index].oldPrice ?? 0.0,
                              price: data[index].price ?? 0.0,
                              productId: data[index].productId ?? "",
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$${data[index].oldPrice}",
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 18,
                                            decoration:
                                                TextDecoration.lineThrough,
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
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 2 / 3));
          },
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
