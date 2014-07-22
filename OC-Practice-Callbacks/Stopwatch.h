//
//  Stopwatch.h
//  OC-Practice-Callbacks
//
//  Created by Chase Gosingtian on 7/17/14.
//  Copyright (c) 2014 KLab Cyscorpions, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stopwatch : NSObject
{
    NSTimer *timer;
    int seconds;
}

extern NSString * const NOTICE_TIMER_ENDED;

- (void)startTimer;
- (void)stopTimer;

- (void)reportTime;
- (int)getTimeInSeconds;

- (void) timerEndedNotice;
- (void) timerEndedAction: (NSNotification *) notice;

@end
