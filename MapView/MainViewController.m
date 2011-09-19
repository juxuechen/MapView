//
//  MainViewController.m
//  MapView
//
//  Created by jx on 9/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainViewController.h"
#import "MapViewController.h"

@implementation MainViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
		self.title = @"map";
		self.view.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

- (void) viewDidLoad {
	UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(50, 50, 120, 40)];
	label.text = @"我在这里～map";
	[self.view addSubview:label];
	
	UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	button.frame = CGRectMake(100, 50, 230, 40);
	[button addTarget:self action:@selector(map) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
}

- (void) map {
	MapViewController *mapViewController = [[MapViewController alloc] init];
	mapViewController.userInfo = [[NSDictionary alloc] initWithObjectsAndKeys:
								   @"120.093057",@"lon",
								   @"30.269354",@"lat",
								   @"我在这里～",@"name",nil];
	mapViewController.view.frame = CGRectMake(300.0f, 480.0f, 280.0f, 420.0f);
	
	[[[[UIApplication sharedApplication] windows] objectAtIndex:0] addSubview:mapViewController.view];
	
    [UIView beginAnimations:@"map-largen" context:nil];
    [UIView setAnimationDuration:0.3];
	mapViewController.view.frame = CGRectMake(20.0f, 30.0f, 280.0f, 420.0f);
    [UIView commitAnimations];
	
	
	UIButton *mapbutton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	mapbutton.frame = CGRectMake(285, 25, 30, 30);
	[mapbutton addTarget:self action:@selector(removeMap) forControlEvents:UIControlEventTouchUpInside];
	[[[[UIApplication sharedApplication] windows] objectAtIndex:0] addSubview:mapbutton];


}

- (void) removeMap {
	UIWindow * window = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
	NSMutableArray *array = [NSMutableArray arrayWithArray:window.subviews];
	if (3 <= [array count]) {
		[[array objectAtIndex:([array count] -1)] removeFromSuperview];
		[[array objectAtIndex:([array count] -2)] removeFromSuperview];
	}
}

@end
