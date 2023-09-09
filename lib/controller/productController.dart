import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kryspy/model/product_model.dart';
import 'package:kryspy/services/productService.dart';

final productControllerProvider=StateNotifierProvider<ProductController,bool>((ref) {
  final productServices=ref.watch(productServiceProvider);
  return ProductController(productService: productServices, ref: ref);
});

final getProductsProvider=StreamProvider((ref) {
  return ref.watch(productControllerProvider.notifier).getAllProducts();
}); 

final getProductsIdProvider=StreamProvider.family<ProductModel,String>((ref,data) {
  return ref.watch(productControllerProvider.notifier).getProductById(data);
}); 

class ProductController extends StateNotifier<bool>{

final ProductService _productService;
final Ref _ref;

ProductController({
  required ProductService productService,
  required Ref ref,
}):_productService=productService,_ref=ref,super(false);

Stream<List<ProductModel>> getAllProducts(){
return _productService.getProducts();
}

Stream<ProductModel> getProductById(String id){
return _productService.getProductById(id);
}

}