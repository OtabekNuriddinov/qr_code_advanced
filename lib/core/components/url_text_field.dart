import 'package:flutter/material.dart';

import '../theme/colors.dart';
import '../theme/dimens.dart';

class UrlTextField extends StatelessWidget {
  final TextEditingController urlController;
  const UrlTextField({required this.urlController, super.key,});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: urlController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'https://example.com',
        border: OutlineInputBorder(
            borderRadius: AppDimens.c8
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: AppColors.indigo, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.grey600),
        ),
        prefixIcon: const Icon(Icons.link),
      ),
    );
  }
}