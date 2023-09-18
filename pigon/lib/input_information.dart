import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pigon/main.dart';
import 'select_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInformation {
  String name = '';
  String introduction = '';
  String link = '';
  String linkDescription = '';
}

final _nameController = TextEditingController();
final _introductionController = TextEditingController();
final _linkController = TextEditingController();
final _linkDescriptionController = TextEditingController();

class InputFormScreen extends ConsumerWidget {
  const InputFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              const Gap(60),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 60),
                  const Text(
                    'サイト情報登録',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 100),
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: '名前',
                    border: OutlineInputBorder(),
                  ),
                  controller: _nameController),
              const SizedBox(height: 20),
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: '自己紹介',
                    border: OutlineInputBorder(),
                  ),
                  controller: _introductionController),
              const SizedBox(height: 20),
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'リンク',
                    border: OutlineInputBorder(),
                  ),
                  controller: _linkController),
              const SizedBox(height: 20),
              TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'リンク説明',
                    border: OutlineInputBorder(),
                  ),
                  controller: _linkDescriptionController),
              const Gap(150),
              ElevatedButton(
                onPressed: () {
                  final userInformation = {
                    'name': _nameController.value.text,
                    'selfIntroduction': _introductionController.value.text,
                    'career': _linkController.value.text,
                    'linkDescription': _linkDescriptionController.value.text,
                    'imageDescriptions': {
                      '1': '1枚目の画像の説明',
                      '2': '2枚目の画像の説明',
                      '4': '4枚目の画像の説明',
                    }
                  };
                  ref
                      .read(userInformationProvider.notifier)
                      .addInformation(userInformation);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImagePickerScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: const Text(
                  '完了',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
