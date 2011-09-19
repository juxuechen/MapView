//
//  MapViewController.h
//  YunPlus
//
//  Created by jx on 9/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "Annotation.h"

@interface MapViewController : UIViewController <MKMapViewDelegate>{
	MKMapView *map;
	NSDictionary *userInfo;
	Annotation *userAnnotation;
}

@property (nonatomic,retain) NSDictionary *userInfo;

@end
