//
//  Annotation.h
//  YunPlus
//
//  Created by jx on 9/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface Annotation : NSObject<MKAnnotation> {
	NSDictionary *userInfo;
}

@property (nonatomic, retain) NSDictionary *userInfo;

@end
