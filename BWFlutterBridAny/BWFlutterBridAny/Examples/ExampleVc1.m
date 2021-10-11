//
//  ExampleVc1.m
//  BWFlutterBridAny
//
//  Created by bairdweng on 2021/10/11.
//

#import "ExampleVc1.h"
#import "AppDelegate.h"
#import "FLBaseViewController.h"
@interface ExampleVc1 ()

@end

@implementation ExampleVc1

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view from its nib.
}


- (IBAction)openFirstPage:(id)sender {
	FLBaseViewController *base1 = [[FLBaseViewController alloc]initWithEnterPointName:@"nativeHome"];
	[self.navigationController pushViewController:base1 animated:YES];
}

- (IBAction)openSecondPage:(id)sender {
	FLBaseViewController *base1 = [[FLBaseViewController alloc]initWithEnterPointName:@"nativeSetting"];
	[self.navigationController pushViewController:base1 animated:YES];
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
