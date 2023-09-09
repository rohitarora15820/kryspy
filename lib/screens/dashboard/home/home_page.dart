import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kryspy/providers/auth_provider.dart';

import '../../../providers/data_provider.dart';
import '../../../providers/global_providers.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key,this.name});
  final String? name;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {

  @override
  void initState() {
 
    
    // TODO: implement initState
    super.initState();
  }

  
  

  @override
  Widget build(BuildContext context) {
    final data=ref.watch(itemListProvider);
   
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        GoRouter.of(context).push('/CreateItem');
      }, label:const  Text("Add Items")),
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text("HomePage"),
        actions: [IconButton(onPressed: ()async{
    await ref.read(authProviders).logoutFromFirebase(context);

        }, icon:const Icon(Icons.logout))],
      ),
      body: data.when(data: (data){
        return ListView(
          children: data.map((e) => Card(
            child: ListTile(
              title: Text(e.category),
              trailing: Text(e.name),
              subtitle: Text(e.price.toString()),
            )
          )).toList(),
        );
      }, error: (error, stackTrace) {
        return Text(error.toString());
      }, loading: () => Center(child: CircularProgressIndicator(),),)
    );
  }
}