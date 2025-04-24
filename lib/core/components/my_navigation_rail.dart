import 'package:flutter/material.dart';

import '../../app_state/change_notifier.dart';
import '../../models/nav_item.dart';
import '../theme/colors.dart';
import '../theme/dimens.dart';

class MyNavigationRail extends StatelessWidget {
  const MyNavigationRail({
    super.key,
    required this.provider,
    required this.item,
    required this.index
  });

  final AppProvider provider;
  final NavItem item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: InkWell(
        onTap: () {
          provider.setCurrentIndex(index);
        },
        child: Container(
          margin: AppDimens.mH12V4,
          padding: AppDimens.pAll12,
          decoration:
          BoxDecoration(borderRadius: AppDimens.c8),
          child: Row(
            children: [
              Icon(
                item.icon,
                color: index == provider.currentIndex
                    ? AppColors.indigo
                    : AppColors.grey600,
                size: AppDimens.d22,
              ),
              AppDimens.w16,
              Text(
                item.label,
                style: TextStyle(
                  fontSize: AppDimens.d14,
                  color: index == provider.currentIndex
                      ? AppColors.indigo
                      : AppColors.grey600,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}