//
//  WEPlaydeckVC.m
//  CGI
//
//  Created by Zubov Ivan on 08/02/17.
//  Copyright © 2017 Zubov Ivan. All rights reserved.
//

#import "WEPlaydeckVC.h"

@interface WEPlaydeckVC ()

@end

@implementation WEPlaydeckVC


- (void)viewDidLoad {
    [super viewDidLoad];
	[self.presentorDelegate viewReady];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - View delegate

- (void) initDesk{
	const float marginh = round(CGRectGetWidth(self.view.frame)/20);
	const float marginb = round(CGRectGetHeight(self.view.frame)/6);
	const float width = CGRectGetWidth(self.view.frame)-marginh*2;
	
	CGRect deskRect = CGRectMake(marginh, CGRectGetHeight(self.view.frame)-marginb-width, width, width);
	
	self.deskView = [[WEDeskView alloc] initWithFrame:deskRect];
	
	[self.view addSubview:self.deskView];
	
	
//	[self.deskView moveChipWithType:WEObjectChipTypeBlue toPos:CGRectMake(2, 1, 2, 2)];
//	[self.deskView moveChipWithType:WEObjectChipTypeRed toPos:CGRectMake(3, 2, 3, 3)];
}

-(void) moveChipWithType:(WEObjectChipType) chipType toPos:(CGRect) pos animated:(BOOL) animated{
	[self.deskView moveChipWithType:chipType toPos:pos];
}

@end
