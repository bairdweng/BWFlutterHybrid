//
//  FLBaseViewController.h
//  BWFlutterBridAny
//
//  Created by bairdweng on 2021/10/11.
//

#import <UIKit/UIKit.h>
#import <Flutter/FlutterViewController.h>
@interface FLBaseViewController : FlutterViewController
- (instancetype)initWithEnterPointName:(NSString *)name;
- (void)handleMethods:(FlutterMethodCall *)call resultBlock:(FlutterMethodCallHandler *)block;
@end
