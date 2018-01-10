//
//  ViewController.h
//  FacialExpressionDetection
//
//  Created by Qifang Bao on 1/10/18.
//  Copyright © 2018 Qifang Bao. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Affdex/Affdex.h>

@interface ViewController : NSViewController

    @property (strong) AFDXDetector *detector;
    @property (strong) IBOutlet NSImageView *imageView;
    @property (strong) IBOutlet NSTextField *time;
    @property (strong) IBOutlet NSTextField *anger;
    @property (strong) IBOutlet NSTextField *contempt;
    @property (strong) IBOutlet NSTextField *disgust;
    @property (strong) IBOutlet NSTextField *fear;
    @property (strong) IBOutlet NSTextField *joy;
    @property (strong) IBOutlet NSTextField *sadness;
    @property (strong) IBOutlet NSTextField *surprise;
    @property (strong) IBOutlet NSTextField *engagement;
    @property (strong) IBOutlet NSTextField *valence;
    @property (strong) IBOutlet NSTextField *attention;

@end

