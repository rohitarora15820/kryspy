import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kryspy/model/product_model.dart';
import 'package:kryspy/services/productService.dart';

final productControllerProvider =
    StateNotifierProvider<ProductController, bool>((ref) {
  final productServices = ref.watch(productServiceProvider);
  return ProductController(productService: productServices, ref: ref);
});

final getProductsProvider = StreamProvider((ref) {
  return ref.watch(productControllerProvider.notifier).getAllProducts();
});

final getProductsIdProvider =
    StreamProvider.family<ProductModel, String>((ref, data) {
  return ref.watch(productControllerProvider.notifier).getProductById(data);
});

final getProductsByCaregoryProvider = StreamProvider.family(
    (ref, String categoryName) => ref
        .watch(productControllerProvider.notifier)
        .getProductsByCategory(categoryName));

final searchProvider = StreamProvider.family((ref, String searchName) =>
    ref.watch(productControllerProvider.notifier).searchProducts(searchName));

class ProductController extends StateNotifier<bool> {
  final ProductService _productService;
  final Ref _ref;

  ProductController({
    required ProductService productService,
    required Ref ref,
  })  : _productService = productService,
        _ref = ref,
        super(false);

  Stream<List<ProductModel>> getAllProducts() {
    return _productService.getProducts();
  }

  Stream<ProductModel> getProductById(String id) {
    return _productService.getProductById(id);
  }

  Stream<List<ProductModel>> getProductsByCategory(String categoryName) {
    return _productService.getProductsByCategoryName(categoryName);
  }

  Stream<List<ProductModel>> searchProducts(String search) {
    return _productService.searchProducts(search);
  }
}
