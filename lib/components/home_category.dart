import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../controller/categoryController.dart';

class HomeCategory extends ConsumerStatefulWidget {
  const HomeCategory({super.key});

  @override
  ConsumerState<HomeCategory> createState() => _HomeCategoryState();
}

class _HomeCategoryState extends ConsumerState<HomeCategory> {
  @override
  Widget build(BuildContext context) {
    final categoryData = ref.watch(getCategoryProvider);
    return Container(
        height: 85.h,
        child: categoryData.when(
          data: (data) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).pushNamed('productByCategory',
                          queryParameters: {'categoryName': data[index].name});
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          child: Image.network(
                            data[index].image!,
                            fit: BoxFit.cover,
                            width: 120.w,
                            height: 120.h,
                          ),
                        ),
                        Text(
                          data[index].name!,
                          style:  TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) {
            return Text(error.toString());
          },
          loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
