import 'package:flutter/material.dart';

import '../../app_state/change_notifier.dart';
import '../app_lists/app_lists.dart';
import '../theme/colors.dart';
import '../theme/dimens.dart';
import '../theme/text_styles.dart';

class PngSvgJpgContainer extends StatelessWidget {
  const PngSvgJpgContainer({
    super.key,
    required this.provider,
  });

  final AppProvider provider;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        AppLists.pngSvgJpg.length,
            (index) {
          final item = AppLists.pngSvgJpg[index];
          return Material(
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                provider.setPngSvgJpgIndex(index);
              },
              child: Container(
                width: AppDimens.d70,
                height: AppDimens.d40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFF0C0035),
                  border: Border.all(
                    color: provider.pngSvgJpgIndex == index
                        ? AppColors.white
                        : Color(0xFF0C0035),
                    width: 3,
                  ),
                ),
                child: Center(
                  child: Text(
                    item,
                    style: AppTextStyles.whiteText,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
