//
//  ViewController.m
//  CGI
//
//  Created by Zubov Ivan on 06/02/17.
//  Copyright © 2017 Zubov Ivan. All rights reserved.
//

#import "ViewController.h"
#import "WEmometr.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	int xm = 20;
	int ym = CGRectGetHeight(self.view.frame)/2;
	int h = self.view.frame.size.width - xm * 2;
	CGRect sliderFrame = CGRectMake(xm,ym-h/2, self.view.frame.size.width - xm * 2, h);
	WEmometr * metr = [[WEmometr alloc] initWithFrame:sliderFrame] ;
//	metr.backgroundColor = [UIColor redColor];
	self.view.backgroundColor = [UIColor redColor];
	
	[self.view addSubview:metr];
	
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
