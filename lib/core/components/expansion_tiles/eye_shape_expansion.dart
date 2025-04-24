import 'package:flutter/material.dart';

import '../../../app_state/change_notifier.dart';
import '../../app_lists/app_lists.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

class EyeShapeExpansionTile extends StatelessWidget {
  const EyeShapeExpansionTile({
    super.key,
    required this.provider,
  });

  final AppProvider provider;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: AppColors.white,
      collapsedIconColor: AppColors.white,
      backgroundColor: AppColors.indigo,
      title: Text(
        "EYE SHAPE",
        style: TextStyle(color: Colors.white),
      ),
      children: [
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              AppLists.shapes.length,
                  (index) {
                final text = AppLists.shapes[index];
                return Material(
                  borderRadius: BorderRadius.circular(8),
                  child: InkWell(
                    onTap: () {
                      provider.setSelectedEyeShape(index);
                    },
                    child: Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.indigo,
                        border: Border.all(
                            color: provider.selectedEyeShapeIndex == index
                                ? AppColors.white
                                : Colors.transparent,
                            width: 3
                        ),
                      ),
                      child: Center(
                        child: Text(
                          text,
                          style: AppTextStyles.whiteText,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ))
      ],
    );
  }
}
