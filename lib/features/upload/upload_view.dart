import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insights_news/core/function/routing.dart';
import 'package:insights_news/core/function/show_error_dialogs.dart';
import 'package:insights_news/core/services/local_storage.dart';
import 'package:insights_news/core/utils/assets_images.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_style.dart';
import 'package:insights_news/core/widgets/custom_button.dart';
import 'package:insights_news/core/widgets/nav_bar_widget.dart';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  GlobalKey key = GlobalKey<FormState>();
  String? path;
  String name = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColoes.darkBackground,
      appBar: AppBar(
        backgroundColor: AppColoes.darkBackground,
        actions: [
          TextButton(
              onPressed: () {
                if (name.isEmpty && path == null) {
                  showErrorDialogs(
                      context: context, text: 'Enter your name and imag');
                } else if (name.isNotEmpty && path == null) {
                  showErrorDialogs(context: context, text: 'Enter your  imag');
                } else if (name.isEmpty && path != null) {
                  showErrorDialogs(context: context, text: 'Enter your name');
                } else {
                  AppLocalStorage.cachData(key: 'name', value: name);
                  AppLocalStorage.cachData(key: 'image', value: path);
                  AppLocalStorage.cachData(key: 'isUpload', value: true);
                  navigatorToReplacement(context, NavBarWidget());
                }
              },
              child: Text(
                'Done',
                style: getBodyStyle(context, color: AppColoes.primary),
              ))
        ],
      ),
      body: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.all(19.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 80,
                  backgroundImage: (path != null)
                      ? FileImage(File(path!)) as ImageProvider
                      : AssetImage(AssetImages.avatar),
                ),
                const Gap(20),
                CustomButton(
                  width: 240,
                  text: 'Upload from Camera',
                  onPressed: () {
                    uploadFromCamera();
                  },
                ),
                const Gap(15),
                CustomButton(
                  width: 240,
                  text: 'Upload from Gallery',
                  onPressed: () {
                    uploadFromGallery();
                  },
                ),
                const Gap(10),
                Divider(
                  endIndent: 35,
                  indent: 35,
                  color: AppColoes.primary,
                ),
                const Gap(15),
                CustomTextFormField(
                  hintText: 'Enter your username',
                  validator: (data) {
                    if (data == null) {
                      return 'Enter your name';
                    }
                    return null;
                  },
                  hint: 'Enter Your Name',
                  onChanged: (data) {
                    name = data;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void uploadFromCamera() async {
    final pickerImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickerImage != null) {
      setState(() {
        path = pickerImage.path;
      });
    }
  }

  void uploadFromGallery() async {
    final pickerImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickerImage != null) {
      setState(() {
        path = pickerImage.path;
      });
    }
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required String hint,
    this.validator,
    required this.onChanged,
    required this.hintText,
  });

  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      style: getBodyStyle(context, color: AppColoes.white),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: getBodyStyle(context, color: AppColoes.white)),
    );
  }
}
