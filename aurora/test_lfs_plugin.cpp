#include <test_lfs/test_lfs_plugin.h>

namespace Channels {
constexpr auto Methods = "test_lfs";
} // namespace Channels

namespace Methods {
constexpr auto PlatformVersion = "getPlatformVersion";
} // namespace Methods

void TestLfsPlugin::RegisterWithRegistrar(
    flutter::PluginRegistrar *registrar) {
  // Create MethodChannel with StandardMethodCodec
  auto methodChannel = std::make_unique<MethodChannel>(
      registrar->messenger(), Channels::Methods,
      &flutter::StandardMethodCodec::GetInstance());

  // Create plugin
  std::unique_ptr<TestLfsPlugin> plugin(
      new TestLfsPlugin(std::move(methodChannel)));

  // Register plugin
  registrar->AddPlugin(std::move(plugin));
}

TestLfsPlugin::TestLfsPlugin(
    std::unique_ptr<MethodChannel> methodChannel)
    : m_methodChannel(std::move(methodChannel)) {
  // Create MethodHandler
  RegisterMethodHandler();
}

void TestLfsPlugin::RegisterMethodHandler() {
  m_methodChannel->SetMethodCallHandler(
      [this](const MethodCall &call, std::unique_ptr<MethodResult> result) {
        if (call.method_name().compare(Methods::PlatformVersion) == 0) {
          result->Success(onGetPlatformVersion());
        } else {
          result->Success();
        }
      });
}

EncodableValue
TestLfsPlugin::onGetPlatformVersion() {
  return "Aurora OS.";
}
