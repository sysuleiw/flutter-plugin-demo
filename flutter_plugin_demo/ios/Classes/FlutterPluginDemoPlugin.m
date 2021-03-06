#import "FlutterPluginDemoPlugin.h"
#import "TestUIView.h"

@implementation FlutterPluginDemoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_plugin_demo"
            binaryMessenger:[registrar messenger]];
  FlutterPluginDemoPlugin* instance = [[FlutterPluginDemoPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];

    [self registerCustomView:registrar];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

+ (void)registerCustomView:(NSObject<FlutterPluginRegistrar>*)registrar
{
    TestUIViewFactory* webviewFactory =
    [[TestUIViewFactory alloc] initWithMessenger:registrar.messenger];
    [registrar registerViewFactory:webviewFactory withId:@"plugins.flutter.io/testUIView"];
}
@end
