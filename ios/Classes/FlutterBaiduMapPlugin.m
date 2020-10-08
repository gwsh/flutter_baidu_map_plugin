#import "FlutterBaiduMapPlugin.h"

@implementation FlutterBaiduMapPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"flutter_baidu_map_plugin"
            binaryMessenger:[registrar messenger]];
  FlutterBaiduMapPlugin* instance = [[FlutterBaiduMapPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"addFunction" isEqualToString:call.method]) {
      NSInteger val = 100;
      val += [[call.arguments objectForKey:@"num"] intValue];
      result([NSNumber numberWithLong:val]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
