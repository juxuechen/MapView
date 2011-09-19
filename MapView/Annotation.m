//
//  Annotation.m
//  YunPlus
//
//  Created by jx on 9/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Annotation.h"

@implementation Annotation

@synthesize userInfo;

- (CLLocationCoordinate2D)coordinate{
    CLLocationCoordinate2D theCoordinate;
    theCoordinate.latitude = [[userInfo objectForKey:@"lat"] floatValue];
    theCoordinate.longitude = [[userInfo objectForKey:@"lon"] floatValue];
    return theCoordinate; 
}

- (NSString *)title{
	return [NSString stringWithFormat:@"%@", [userInfo objectForKey:@"name"]];
}

// optional
- (NSString *)subtitle{
    return [NSString stringWithFormat:@"%@   %@", [userInfo objectForKey:@"lon"], [userInfo objectForKey:@"lat"]];
}


@end
