import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kryspy/model/item_model.dart';
import 'package:tuple/tuple.dart';

import 'auth_provider.dart';
import 'data_provider.dart';

// final signUpGlobalProviders=FutureProvider.family<Tuple2<String,String>>((ref,tupleData) => ref.read(authProviders).signUpWithEmailAndPassword(tupleData.item, password));

final itemListProvider=StreamProvider<List<ItemModel>>((ref) => ref.read(dataProvider).itemStream);