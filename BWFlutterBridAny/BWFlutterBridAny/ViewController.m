//
//  ViewController.m
//  BWFlutterBridAny
//
//  Created by bairdweng on 2021/10/9.
//

#import "ViewController.h"
#import "ExampleVc1.h"
#import "CallMethodViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic, copy) NSArray *listItems;

@end

@implementation ViewController


- (void)viewDidLoad {
	[super viewDidLoad];
	self.tableView.delegate = self;
	self.tableView.dataSource = self;
	[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellId"];
	[self loadData];
}

- (void)loadData {
	self.listItems = @[@"看看基础",@"数据交互"];
	[self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellId" forIndexPath:indexPath];
	cell.textLabel.text = self.listItems[indexPath.row];
	return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.listItems.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	switch (indexPath.row) {
	case 0: {
		ExampleVc1 *vc1 = [[ExampleVc1 alloc]init];
		[self.navigationController pushViewController:vc1 animated:YES];
	}
	break;
	case 1: {
		CallMethodViewController *methodsVc = [[CallMethodViewController alloc]init];
		[self.navigationController pushViewController:methodsVc animated:YES];
	}
	default:
		break;
	}

}


@end
