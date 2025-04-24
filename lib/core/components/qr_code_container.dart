import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_advanced/core/utils/app_snackbar.dart';
import '../theme/text_styles.dart';
import '/app_state/change_notifier.dart';
import '/core/app_lists/app_lists.dart';
import '/core/components/png_svg_jpg_containers.dart';
import '/core/theme/colors.dart';
import '/core/theme/dimens.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'expansion_tiles/colors_expansion.dart';
import 'expansion_tiles/eye_shape_expansion.dart';
import 'expansion_tiles/logo_expansion.dart';

class QrCodeContainer extends StatefulWidget {
  const QrCodeContainer({super.key});

  @override
  State<QrCodeContainer> createState() => _QrCodeContainerState();
}

class _QrCodeContainerState extends State<QrCodeContainer> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(color: const Color(0xFF0C0035)),
        ),
        Container(
        decoration: BoxDecoration(color: const Color(0xFF0C0035)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: AppDimens.d200,
                  height: AppDimens.d200,
                  color: AppColors.white,
                  child: provider.urlController.text.isEmpty
                      ? Center(
                          child: Text(
                            "Enter URL",
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      : QrImageView(
                          eyeStyle: QrEyeStyle(
                              eyeShape: provider.selectedEyeShapeIndex == 0
                                  ? QrEyeShape.circle
                                  : QrEyeShape.square,
                              color: AppLists.colors[provider.selectedColorIndex]),
                          dataModuleStyle: QrDataModuleStyle(
                              color: AppLists.colors[provider.selectedColorIndex]),
                          embeddedImage: AppLists.logos[provider.selectedLogoIndex],
                          embeddedImageStyle: QrEmbeddedImageStyle(
                            size: Size(40, 40),
                          ),
                          backgroundColor: Colors.white,
                          data: provider.urlController.text,
                          version: QrVersions.auto,
                          size: AppDimens.d200,
                        ),
                ),
                AppDimens.h20,
                ColorsExpansionTile(provider: provider),
                AppDimens.h20,
                EyeShapeExpansionTile(provider: provider),
                AppDimens.h20,
                LogoExpansionTile(provider: provider),
                AppDimens.h30,
                PngSvgJpgContainer(provider: provider),
                AppDimens.h30,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: provider.mailController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Your mail address",
                      hintStyle: AppTextStyles.whiteText,
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.white,
                          width: 2,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.white,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ),
                AppDimens.h30,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.maxFinite, 70),
                      backgroundColor: AppColors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: AppDimens.c8,
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Download Code",
                      style: AppTextStyles.whiteText,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ]
    );
  }

}
