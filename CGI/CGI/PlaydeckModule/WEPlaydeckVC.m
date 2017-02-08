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


@end
