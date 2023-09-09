import 'package:flutter/material.dart';

import '../../../components/home_category.dart';
import '../../../components/product_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
              child: Align(
                  child: Text(
                "kryspy",
                style: TextStyle(color: Colors.black, fontSize: 18),
              )),
            ),
            Card(
              elevation: 1,
              child: TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      size: 20,
                      color: Colors.black,
                    ),
                    suffixIcon: Icon(Icons.tune),
                    hintText: "Search Product",
                    hintStyle: TextStyle(color: Colors.black, fontSize: 18),
                    contentPadding: EdgeInsets.only(top: 12)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            HomeCategory(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Products",style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),),
                   Text("See All",style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),)
                ],
              ),
            ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: ProductWidget(),
          )
          ],
        ),
      ),
    );
  }
}
