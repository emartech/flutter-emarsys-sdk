import 'package:emarsys_sdk/api/emarsys.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const MethodChannel channel = MethodChannel('com.emarsys.methods');

  TestWidgetsFlutterBinding.ensureInitialized();
  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return null;
    });
  });

  test('pushSendingEnabled should delegate to the Platform', () async {
    final enable = true;
    MethodCall? actualMethodCall;
    channel.setMockMethodCallHandler((MethodCall methodCall) {
      actualMethodCall = methodCall;
      return null;
    });
    await Emarsys.push.pushSendingEnabled(enable);

    expect(actualMethodCall != null, true);
    if (actualMethodCall != null) {
      expect(actualMethodCall!.method, 'push.pushSendingEnabled');
      expect(actualMethodCall!.arguments, {"pushSendingEnabled": enable});
    }
  });

  test('setPushToken should delegate to the Platform', () async {
    final testPushToken = "testPushToken";
    MethodCall? actualMethodCall;
    channel.setMockMethodCallHandler((MethodCall methodCall) {
      actualMethodCall = methodCall;
      return null;
    });
    await Emarsys.push.setPushToken(testPushToken);

    expect(actualMethodCall != null, true);
    if (actualMethodCall != null) {
      expect(actualMethodCall!.method, 'push.setPushToken');
      expect(actualMethodCall!.arguments, {"pushToken": testPushToken});
    }
  });

  test('setPushToken should throw error', () async {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      throw PlatformException(
          code: '42',
          message: 'Test error message',
          details: 'Test detail',
          stacktrace: 'Test stacktrace');
    });

    expect(
        Emarsys.push.setPushToken(""),
        throwsA(isA<PlatformException>().having(
            (error) => error.message, 'message', 'Test error message')));
  });

  test('pushSendingEnabled should throw error', () async {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      throw PlatformException(
          code: '42',
          message: 'Test error message',
          details: 'Test detail',
          stacktrace: 'Test stacktrace');
    });

    expect(
        Emarsys.push.pushSendingEnabled(true),
        throwsA(isA<PlatformException>().having(
            (error) => error.message, 'message', 'Test error message')));
  });
}
