import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kryspy/model/category_model.dart';
import 'package:kryspy/services/categories.dart';

final categoryControllerProvider =
    StateNotifierProvider<CategoryController, bool>((ref) {
  final categoryService = ref.watch(categoryServiceProvider);
  return CategoryController(categoryServices: categoryService, ref: ref);
});

final getCategoryProvider = StreamProvider(
    (ref) => ref.watch(categoryControllerProvider.notifier).getcategories());

class CategoryController extends StateNotifier<bool> {
  final CategoryServices _categoryServices;
  final Ref _ref;

  CategoryController({
    required CategoryServices categoryServices,
    required Ref ref,
  })  : _categoryServices = categoryServices,
        _ref = ref,
        super(false);

  Stream<List<CategoryModel>> getcategories() {
    return _categoryServices.getcategories();
  }
}
