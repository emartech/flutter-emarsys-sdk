import 'dart:io';

import 'package:emarsys_sdk/emarsys_sdk.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  const APPLICATION_CODE = "EMS11-C3FD3";
  const MERCHANT_ID = "EMS11C3FD3";

  setUpAll(() async {
    final config = EmarsysConfig(
        applicationCode: APPLICATION_CODE, merchantId: MERCHANT_ID);
    await Emarsys.setup(config);
  });

  testWidgets("hardwareId should return a non-null value",
      (WidgetTester tester) async {
    final result = await Emarsys.config.hardwareId();
    expect(result, isNot(equals(null)));
    expect(result, isNot(equals("")));
  });

  testWidgets("applicationCode should return the expected value",
      (WidgetTester tester) async {
    final result = await Emarsys.config.applicationCode();
    expect(result, equals(APPLICATION_CODE));
  });

  testWidgets("changeAppCode should be ok", (WidgetTester tester) async {
    bool onErrorHasBeenCalled = false;
    await Emarsys.config
        .changeApplicationCode(APPLICATION_CODE)
        .onError((error, stackTrace) => onErrorHasBeenCalled = true);
    expect(onErrorHasBeenCalled, false);
  });
  testWidgets("languageCode should return a non-null value",
      (WidgetTester tester) async {
    final result = await Emarsys.config.languageCode();
    expect(result, isNot(equals(null)));
  });

  testWidgets("merchantId should return the expected value",
      (WidgetTester tester) async {
    final result = await Emarsys.config.merchantId();
    expect(result, equals(MERCHANT_ID));
  });

  testWidgets("changeMerchantId should be ok", (WidgetTester tester) async {
    bool onErrorHasBeenCalled = false;
    await Emarsys.config
        .changeMerchantId(MERCHANT_ID)
        .onError((error, stackTrace) => onErrorHasBeenCalled = true);
    expect(onErrorHasBeenCalled, false);
  });
  testWidgets("sdkVersion should return  a non-null value",
      (WidgetTester tester) async {
    final result = await Emarsys.config.sdkVersion();
    expect(result, isNot(equals(null)));
  });
  testWidgets("notificationSettings should return  a non-null value",
      (WidgetTester tester) async {
    NotificationSettings result = await Emarsys.config.notificationSettings();
    if (Platform.isAndroid) {
      expect(result.android, isNot(equals(null)));
    }
    if (Platform.isIOS) {
      expect(result.iOS, isNot(equals(null)));
    }
  });
}
