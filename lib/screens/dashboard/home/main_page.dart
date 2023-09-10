import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/home_category.dart';
import '../../../components/product_widget.dart';
import '../../../components/search_delegate_widget.dart';
import '../../../components/size.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<MainPage> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50.h,
                child: Align(
                    child: Text(
                  "krySpy",
                  style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold),
                )),
              ),
              Card(
                elevation: 1,
                child: SizedBox(
                  height: 50.h,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showSearch(
                                context: context,
                                delegate: SearchProducts(ref));
                          },
                          child: Icon(
                            Icons.search,
                            size: 20.r,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Search Products",
                          style:
                              TextStyle(color: Colors.black, fontSize: 18.sp),
                        ),
                        Icon(Icons.tune)
                      ],
                    ),
                  ),
                ),
              ),
              getVerticalSpace(10),
              const HomeCategory(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Products",
                      style: TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: ProductWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
