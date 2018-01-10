//
//  ViewController.m
//  FacialExpressionDetection
//
//  Created by Qifang Bao on 1/10/18.
//  Copyright © 2018 Qifang Bao. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view.
    self.detector = [[AFDXDetector alloc] initWithDelegate:self usingFile:@"/Users/Qifang/Documents/Project-FacialExpression/VideoDownsampled/testVideo_downsampled.mp4" maximumFaces:1];
    [self.detector setDetectAllEmotions:YES];
    [self.detector setDetectAllExpressions:YES];
    self.detector.maxProcessRate = 5;
    [self.detector start];
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];
    
    // Update the view, if already loaded.
}




- (void)detector:(AFDXDetector *)detector hasResults:(NSMutableDictionary *)faces forImage:(NSImage *)image atTime:(NSTimeInterval)time
{
    if (faces == nil)
    {
        self.imageView.image = image;
        
    }
    else
    {
        NSArray *a = [faces allValues];
        if ([a count] > 0)
        {
            // Get values
            AFDXFace *face = [a objectAtIndex:0];
            CGFloat anger = face.emotions.anger;
            CGFloat contempt = face.emotions.contempt;
            CGFloat disgust = face.emotions.disgust;
            CGFloat fear = face.emotions.fear;
            CGFloat joy = face.emotions.joy;
            CGFloat sadness = face.emotions.sadness;
            CGFloat surprise = face.emotions.surprise;
            CGFloat engagement = face.emotions.engagement;
            CGFloat valence = face.emotions.valence;
            CGFloat attention = face.expressions.attention;
            NSNumber *timeStampObj = [NSNumber numberWithDouble: time];
            
            // Output to window
            self.time.stringValue = [NSString stringWithFormat:@"Time: %@", timeStampObj];
            self.anger.stringValue = [NSString stringWithFormat:@"Anger: %.1f", anger];
            self.contempt.stringValue = [NSString stringWithFormat:@"Contempt: %.1f", contempt];
            self.disgust.stringValue = [NSString stringWithFormat:@"Disgust: %.1f", disgust];
            self.fear.stringValue = [NSString stringWithFormat:@"Fear: %.1f", fear];
            self.joy.stringValue = [NSString stringWithFormat:@"Joy: %.1f", joy];
            self.sadness.stringValue = [NSString stringWithFormat:@"Sadness: %.1f", sadness];
            self.surprise.stringValue = [NSString stringWithFormat:@"Surprise: %.1f", surprise];
            self.engagement.stringValue = [NSString stringWithFormat:@"Engagement: %.1f", engagement];
            self.valence.stringValue = [NSString stringWithFormat:@"Valence: %.1f", valence];
            self.attention.stringValue = [NSString stringWithFormat:@"Attention: %.1f", attention];
            
            // Output to file
            NSString *angerString = [NSString stringWithFormat:@"%.1f", anger];
            NSString *contemptString = [NSString stringWithFormat:@"%.1f", contempt];
            NSString *disgustString = [NSString stringWithFormat:@"%.1f", disgust];
            NSString *fearString = [NSString stringWithFormat:@"%.1f", fear];
            NSString *joyString = [NSString stringWithFormat:@"%.1f", joy];
            NSString *sadString = [NSString stringWithFormat:@"%.1f", sadness];
            NSString *surpriseString = [NSString stringWithFormat:@"%.1f", surprise];
            NSString *engagementString = [NSString stringWithFormat:@"%.1f", engagement];
            NSString *valenceString = [NSString stringWithFormat:@"%.1f", valence];
            NSString *attentionString = [NSString stringWithFormat:@"%.1f", attention];
            NSString *emotionString = [NSString stringWithFormat:@"%@, %@, %@, %@, %@, %@, %@, %@, %@, %@, %@ \n", timeStampObj, angerString, contemptString, disgustString, fearString, joyString, sadString, surpriseString, engagementString, valenceString, attentionString];
            
            NSLog(@"%@", emotionString);
            
            NSString *path = @"/Users/Qifang/Documents/Project-FacialExpression/EmotionOutput/emotionString.txt";
            
            NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:path];
            [fileHandle seekToEndOfFile];
            [fileHandle writeData:[emotionString dataUsingEncoding:NSUTF8StringEncoding]];
            [fileHandle closeFile];
            
            
            
        }
    }
    
    
}



- (void)detectorDidFinishProcessing:(AFDXDetector *)detector
{
    NSLog(@"Finished!");
}

@end
