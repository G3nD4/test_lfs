import 'package:flutter_test/flutter_test.dart';
import 'package:test_lfs/test_lfs.dart';
import 'package:test_lfs/test_lfs_platform_interface.dart';
import 'package:test_lfs/test_lfs_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTestLfsPlatform
    with MockPlatformInterfaceMixin
    implements TestLfsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TestLfsPlatform initialPlatform = TestLfsPlatform.instance;

  test('$MethodChannelTestLfs is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTestLfs>());
  });

  test('getPlatformVersion', () async {
    TestLfs testLfsPlugin = TestLfs();
    MockTestLfsPlatform fakePlatform = MockTestLfsPlatform();
    TestLfsPlatform.instance = fakePlatform;

    expect(await testLfsPlugin.getPlatformVersion(), '42');
  });
}
