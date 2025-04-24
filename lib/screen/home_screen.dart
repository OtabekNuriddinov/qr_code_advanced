import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_advanced/core/app_lists/app_lists.dart';
import 'package:qr_code_advanced/core/components/my_elevated_button.dart';
import 'package:qr_code_advanced/core/components/qr_code_container.dart';
import 'package:qr_code_advanced/core/components/url_text_field.dart';
import 'package:qr_code_advanced/core/theme/colors.dart';
import 'package:qr_code_advanced/core/theme/dimens.dart';
import 'package:qr_code_advanced/core/theme/text_styles.dart';
import 'package:qr_code_advanced/models/nav_item.dart';

import '../app_state/change_notifier.dart';
import '../core/components/my_navigation_rail.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 1200) {
      return Scaffold(
        backgroundColor:const Color(0xFF0C0035),
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            "FLOWCODE",
            style: AppTextStyles.flowCode,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              UrlTextField(
                urlController: provider.urlController,
              ),
              AppDimens.h20,
              QrCodeContainer()
            ],
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Row(
        children: [
          Container(
            width: AppDimens.d220,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.grey600)),
            child: Padding(
              padding: AppDimens.ph10,
              child: Column(
                children: [
                  Padding(
                    padding: AppDimens.pAll20,
                    child: Text("FLOWCODE", style: AppTextStyles.flowCode),
                  ),
                  Divider(),
                  Expanded(
                    child: ListView.builder(
                      itemCount: AppLists.navItems.length,
                      itemBuilder: (context, index) {
                        NavItem item = AppLists.navItems[index];
                        return MyNavigationRail(
                          provider: provider,
                          item: item,
                          index: index,
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: AppDimens.phv20,
                    child: MyElevatedButton(),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Enter your website URL", style: AppTextStyles.enter,),
                  AppDimens.h12,
                  Text(
                    'Your QR code will be generated automatically.',
                    style: AppTextStyles.generated,
                  ),
                  AppDimens.h20,
                  Padding(
                    padding: AppDimens.ph100,
                    child: UrlTextField(
                        urlController: provider.urlController,
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
              child: QrCodeContainer(),
          )
        ],
      ),
    );
  }
}
