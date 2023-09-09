import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kryspy/providers/data_provider.dart';

import '../../../components/customTextField.dart';
import '../../../firebase_instance.dart';
import '../../../providers/global_providers.dart';

class CreateItem extends ConsumerStatefulWidget {
  const CreateItem({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CreateItemState();
}

class _CreateItemState extends ConsumerState<CreateItem> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  File? imageFile = File("");
  String? imageUrl;

  Future uploadImageToStorage(File? file) async {
    try {
      imageUrl = file != null
          ? (await (await FirebaseInstances.firebaseStorage!
                  .ref("images")
                  .putFile(file))
              .ref
              .getDownloadURL())
          : null;
      log("Successfully");
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Products"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: () async {
                  final pickedImage = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (pickedImage != null) {
                    imageFile = File(pickedImage.path);
                    log(imageFile.toString());
                    uploadImageToStorage(imageFile);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 194, 224, 248),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      image: imageFile != null
                          ? DecorationImage(
                              fit: BoxFit.cover,
                              image: imageFile != null
                                  ? FileImage(imageFile!) as ImageProvider
                                  : NetworkImage(
                                      "https://upload.wikimedia.org/wikipedia/commons/9/91/Pizza-3007395.jpg"))
                          : null),
                  width: 200,
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (imageFile == null)
                        const Expanded(child: Center(child: Icon(Icons.image))),
                      Material(
                        color: const Color.fromARGB(255, 194, 224, 248),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            "Pick Image".toUpperCase(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              CustomTextField(
                hintText: "Enter product name",
                userNameController: _nameController,
                obscureText: false,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: "Enter category name",
                userNameController: _categoryController,
                obscureText: false,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: "Enter Rating between 1 to 5",
                userNameController: _ratingController,
                obscureText: false,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: "Enter Price",
                userNameController: _priceController,
                obscureText: false,
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                hintText: "Enter Description",
                userNameController: _descriptionController,
                obscureText: false,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () async {
                    await ref.read(dataProvider).writeItems(context,
                        name: _nameController.text,
                        category: _categoryController.text,
                        description: _descriptionController.text,
                        price: int.parse(_priceController.text),
                        rating: int.parse(_ratingController.text),
                        image: imageUrl ?? "");
                  },
                  child: const Text("Add"))
            ],
          ),
        ),
      ),
    );
  }
}
