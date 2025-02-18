import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'test_lfs_platform_interface.dart';

/// An implementation of [TestLfsPlatform] that uses method channels.
class MethodChannelTestLfs extends TestLfsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('test_lfs');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
