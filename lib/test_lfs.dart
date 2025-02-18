
import 'test_lfs_platform_interface.dart';

class TestLfs {
  Future<String?> getPlatformVersion() {
    return TestLfsPlatform.instance.getPlatformVersion();
  }
}
