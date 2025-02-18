import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'test_lfs_method_channel.dart';

abstract class TestLfsPlatform extends PlatformInterface {
  /// Constructs a TestLfsPlatform.
  TestLfsPlatform() : super(token: _token);

  static final Object _token = Object();

  static TestLfsPlatform _instance = MethodChannelTestLfs();

  /// The default instance of [TestLfsPlatform] to use.
  ///
  /// Defaults to [MethodChannelTestLfs].
  static TestLfsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TestLfsPlatform] when
  /// they register themselves.
  static set instance(TestLfsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
