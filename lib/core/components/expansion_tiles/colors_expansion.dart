import 'package:flutter/material.dart';

import '../../../app_state/change_notifier.dart';
import '../../app_lists/app_lists.dart';
import '../../theme/colors.dart';

class ColorsExpansionTile extends StatelessWidget {
  const ColorsExpansionTile({
    super.key,
    required this.provider,
  });

  final AppProvider provider;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: AppColors.white,
      collapsedIconColor: AppColors.white,
      backgroundColor: Colors.indigo,
      onExpansionChanged: (value) {},
      title: Text(
        "COLOR",
        style: TextStyle(
          color: AppColors.white,
        ),
      ),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            AppLists.colors.length,
                (index) {
              final color = AppLists.colors[index];
              return GestureDetector(
                onTap: () {
                  provider.setSelectedColor(index);
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: provider.selectedColorIndex == index
                            ? Colors.white
                            : Colors.transparent,
                        width: 3),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}