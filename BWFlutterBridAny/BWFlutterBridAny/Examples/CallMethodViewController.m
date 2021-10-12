//
//  CallMethodViewController.m
//  BWFlutterBridAny
//
//  Created by Baird-weng on 2021/10/12.
//

#import "CallMethodViewController.h"
#import "FLBaseViewController.h"

@interface CallMethChildVc : FLBaseViewController

@end

@implementation CallMethChildVc

- (void)handleMethods:(FlutterMethodCall *)call resultBlock:(__autoreleasing FlutterMethodCallHandler *)block {
	[super handleMethods:call resultBlock:block];
	NSLog(@"a=================%@",call.method);
}

@end


@interface CallMethodViewController ()
@property(nonatomic, strong) FlutterMethodChannel* myChannel;
@end

@implementation CallMethodViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	CallMethChildVc *vc = [[CallMethChildVc alloc]initWithEnterPointName:@"nativeCallMethods"];
	[self.view addSubview:vc.view];
	vc.view.frame = CGRectMake(0, self.view.frame.size.height - 300, self.view.frame.size.width, 300);
	[self addChildViewController:vc];

	self.myChannel = [FlutterMethodChannel
	                  methodChannelWithName:@"flutterCallMethodChannel"
	                  binaryMessenger:vc.binaryMessenger];

}

- (IBAction)callFlutterMethods:(id)sender {
	[self.myChannel invokeMethod:@"callHello" arguments:@"我调用Flutter sayHello"];
}

/*
 #pragma mark - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   }
 */

@end
