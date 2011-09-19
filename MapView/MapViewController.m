//
//  MapViewController.m
//  YunPlus
//
//  Created by jx on 9/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"

@implementation MapViewController

@synthesize userInfo;

- (void) viewDidLoad {
    [super viewDidLoad];
	map = [[MKMapView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 280.0f, 420.0f)];
	[self.view addSubview:map];
}

- (void) viewWillAppear:(BOOL)animated{
	MKCoordinateRegion newRegion;
    newRegion.center.latitude = [[userInfo objectForKey:@"lat"] floatValue];
    newRegion.center.longitude = [[userInfo objectForKey:@"lon"] floatValue];
    newRegion.span.latitudeDelta = 0.01;
    newRegion.span.longitudeDelta = 0.01;
    [map setRegion:newRegion animated:NO];
	map.delegate = self;
	map.showsUserLocation = NO;
	map.zoomEnabled = YES;
	map.scrollEnabled = YES;
	map.mapType = MKMapTypeStandard;
	userAnnotation = [[Annotation alloc]init];
	userAnnotation.userInfo = userInfo;
	[map addAnnotation:userAnnotation];
	[map selectAnnotation:userAnnotation animated:FALSE];
}

- (void) viewDidDisappear:(BOOL)animated{
	[map removeAnnotations:map.annotations];
	userAnnotation = nil;
}

#pragma mark MKMapViewDelegate
- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView{
	for (id<MKAnnotation> currentAnnotation in map.annotations) {       
		if ([currentAnnotation isEqual:userAnnotation]) {
			[map selectAnnotation:currentAnnotation animated:FALSE];
		}
	}
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{	
	static NSString* AnnotationIdentifier = @"AnnotationIdentifier";
	MKPinAnnotationView* pinView = (MKPinAnnotationView *)
	[map dequeueReusableAnnotationViewWithIdentifier:AnnotationIdentifier];
	if (!pinView) {
		// if an existing pin view was not available, create one
		MKPinAnnotationView* customPinView = [[MKPinAnnotationView alloc]
											   initWithAnnotation:annotation reuseIdentifier:AnnotationIdentifier];
		customPinView.animatesDrop = YES;
		customPinView.canShowCallout = YES;
		customPinView.selected = YES;
		return customPinView;
	}
	else {
		pinView.annotation = annotation;
		
	}
	
	return pinView;	
}

@end
