import 'dart:async';

import 'package:flutter/material.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'package:keicy_network_image/keicy_network_image.dart';

import 'index.dart';
import 'package:asami_app/Pages/App/index.dart';
import 'package:asami_app/Models/index.dart';

class PremiumPage extends StatefulWidget {
  @override
  _PremiumPageState createState() => _PremiumPageState();
}

class _PremiumPageState extends State<PremiumPage> with TickerProviderStateMixin {
  PremiumPageStyles _premiumPageStyles;
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _premiumPageStyles = PremiumPageMobileStyles(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PremiumPageProvider()),
      ],
      child: _containerMain(context),
    );
  }

  Widget _containerMain(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size(_premiumPageStyles.deviceWidth, _premiumPageStyles.asamiAppbarHeight),
          child: Container(
            padding: EdgeInsets.all(_premiumPageStyles.asamiAppbarBottomPadding),
            alignment: Alignment.bottomCenter,
            color: AppColors.appbarColor,
            child: Text(
              PremiumPageString.appbarTitle,
              style: TextStyle(
                fontSize: _premiumPageStyles.appbarTitleFontSize,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Container(
          width: _premiumPageStyles.deviceWidth,
          height: _premiumPageStyles.safeAreaHeight,
          padding: EdgeInsets.symmetric(
            horizontal: _premiumPageStyles.primaryHorizontalPadding,
            vertical: _premiumPageStyles.primaryVerticalPadding,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(AppAssets.premiumBackImage), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                PremiumPageString.description,
                style: TextStyle(
                  fontSize: _premiumPageStyles.descriptionFontSiz,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: _premiumPageStyles.itemSpacing),
              Image.asset(AppAssets.logo1, width: _premiumPageStyles.logoImageWidth, fit: BoxFit.fitWidth),
              SizedBox(height: _premiumPageStyles.itemSpacing),
              GestureDetector(
                child: Text(
                  PremiumPageString.login,
                  style: TextStyle(
                    fontSize: _premiumPageStyles.textFontSize,
                    fontStyle: FontStyle.italic,
                    color: AppColors.primaryColor,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationColor: AppColors.primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () {},
              ),
              SizedBox(height: _premiumPageStyles.itemSpacing),
              GestureDetector(
                child: Text(
                  PremiumPageString.signup,
                  style: TextStyle(
                    fontSize: _premiumPageStyles.textFontSize,
                    fontStyle: FontStyle.italic,
                    color: AppColors.primaryColor,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationColor: AppColors.primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
                onTap: () {},
              ),
              SizedBox(height: _premiumPageStyles.widthDp * 100),
            ],
          ),
        ),
      ),
    );
  }
}