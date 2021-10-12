//
//  FLBaseViewController.m
//  BWFlutterBridAny
//
//  Created by bairdweng on 2021/10/11.
//

#import "FLBaseViewController.h"
#import "AppDelegate.h"
@interface FLBaseViewController ()

@end

@implementation FLBaseViewController


- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}

- (instancetype)initWithEnterPointName:(NSString *)name {
	AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
	FlutterEngine *engineObj = [appDelegate.engineGroup makeEngineWithEntrypoint:name libraryURI:nil];
	self = [super initWithEngine:engineObj nibName:nil bundle:nil];
	if (self) {

	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	// 创建一个通道用于Flutter的回调。
	[self createChannel];

	// Do any additional setup after loading the view.
}

- (void)createChannel {
	FlutterMethodChannel* channel = [FlutterMethodChannel
	                                 methodChannelWithName:@"BaseControllerChannel"
	                                 binaryMessenger:self.binaryMessenger];
	__weak typeof(self) weakSelf = self;
	[channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult _Nonnull result) {
	         NSLog(@"当前线程:%@  回调方法：%@ 所有的参数列表：%@",[NSThread currentThread],call.method,call.arguments);
	         if ([call.method isEqualToString:@"back"]) {
			 [weakSelf goBack];
		 }
	 }];
}

- (void)handleMethods:(FlutterMethodCall *)call resultBlock:(FlutterMethodCallHandler *)block {
	if ([call.method isEqualToString:@"back"]) {
		[self goBack];
	}
}

- (void)goBack {
	[self.navigationController popViewControllerAnimated:YES];
}
@end
