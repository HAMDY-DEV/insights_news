import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insights_news/core/services/local_storage.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/core/widgets/custom_button.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  TextEditingController nameController = TextEditingController();
  late bool themeMode;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = AppLocalStorage.gatCachData(key: 'name');
    themeMode = AppLocalStorage.gatCachData(key: 'darkMode') ?? true;
  }

  String? pathImage;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColoes.darkBackground,
        foregroundColor: AppColoes.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: FileImage(
                      File(AppLocalStorage.gatCachData(key: 'image'))),
                ),
                Positioned(
                    right: BorderSide.strokeAlignCenter,
                    bottom: BorderSide.strokeAlignCenter,
                    child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                padding: const EdgeInsets.all(10),
                                height: 180,
                                child: Column(
                                  children: [
                                    const Gap(20),
                                    CustomButton(
                                        onPressed: () {
                                          setState(() {
                                            getImage(ImageSource.camera);
                                          });
                                        },
                                        text: 'Upload from Camera'),
                                    const Gap(20),
                                    CustomButton(
                                        onPressed: () {
                                          setState(() {
                                            getImage(ImageSource.gallery);
                                          });
                                        },
                                        text: 'Upload from Gallery')
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: AppColoes.darkBackground,
                          foregroundColor: theme.primary,
                          child: Icon(
                            Icons.camera_alt,
                            color: AppColoes.primary,
                            size: 18,
                          ),
                        ))),
              ],
            ),
            const Gap(30),
            Divider(
              endIndent: 30,
              indent: 30,
              color: AppColoes.primary,
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ValueListenableBuilder(
                  valueListenable: Hive.box('user').listenable(),
                  builder: (context, value, child) {
                    return Text(
                      AppLocalStorage.gatCachData(key: 'name'),
                      style: getBodyStyle(context,
                          color: AppColoes.primary,
                          fontWeight: FontWeight.bold),
                    );
                  },
                ),
                GestureDetector(
                  onTap: () {
                    var key = GlobalKey<FormState>();
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      backgroundColor: AppColoes.darkBackground,
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).viewInsets.bottom),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            height: 180,
                            child: Form(
                              key: key,
                              child: Column(
                                children: [
                                  const Gap(20),
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Enter your name';
                                      }
                                      return null;
                                    },
                                    controller: nameController,
                                    style: getBodyStyle(context,
                                        color: AppColoes.primary),
                                    decoration: InputDecoration(
                                      hintText: nameController.text,
                                    ),
                                  ),
                                  const Gap(20),
                                  CustomButton(
                                      onPressed: () {
                                        if (key.currentState!.validate()) {
                                          AppLocalStorage.cachData(
                                              key: 'name',
                                              value: nameController.text);
                                        }
                                      },
                                      text: 'save')
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: AppColoes.primary),
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(
                      Icons.edit,
                      color: AppColoes.primary,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void getImage(source) async {
    final ImagePicker pickerImage = ImagePicker();
    XFile? path = await pickerImage.pickImage(source: source);
    if (path != null) {
      setState(() {});
      AppLocalStorage.cachData(key: 'image', value: path.path);
    }
  }
}
