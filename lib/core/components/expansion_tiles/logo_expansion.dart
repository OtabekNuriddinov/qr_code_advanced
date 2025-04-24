import 'package:flutter/material.dart';

import '../../../app_state/change_notifier.dart';
import '../../app_lists/app_lists.dart';
import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

class LogoExpansionTile extends StatelessWidget {
  const LogoExpansionTile({
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
          "LOGO",
          style: AppTextStyles.whiteText,
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              AppLists.logos.length,
                  (index){
                final item = AppLists.logos[index];
                return Material(
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: (){
                      provider.setSelectedLogoIndex(index);
                    },
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                              width: 3,
                              color: provider.selectedLogoIndex == index ? AppColors.white:Colors.transparent
                          ),
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: item,
                          )
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ]
    );
  }
}
