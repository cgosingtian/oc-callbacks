//
//  Stopwatch.m
//  OC-Practice-Callbacks
//
//  Created by Chase Gosingtian on 7/17/14.
//  Copyright (c) 2014 KLab Cyscorpions, Inc. All rights reserved.
//

#import "Stopwatch.h"

@implementation Stopwatch
NSTimer * timer;
int seconds = 0;

extern NSString * const NOTICE_TIMER_ENDED = @"timerEnded";

- (void) startTimer
{
    NSLog(@"Starting timer...");
    if (!timer)
    {
        timer = [NSTimer timerWithTimeInterval:1.0
                                        target:self
                                      selector:@selector(reportTime)
                                      userInfo:nil
                                       repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
        [[NSRunLoop mainRunLoop] run];
    }
}

- (void) stopTimer
{
    if ([timer isValid])
        [timer invalidate];
    timer = nil;
    NSLog(@"Stopped the timer at %d seconds!", seconds);
    [self timerEndedNotice];

}

- (void) reportTime
{
    if ([self getTimeInSeconds] >= 4)
    {
        [self stopTimer];
    }
    else
    {
        NSLog(@"%d seconds elapsed.",seconds);
        seconds++;
    }
}

- (int)getTimeInSeconds
{
    return seconds;
}

//Notification Testing
- (void) timerEndedNotice
{
    [[NSNotificationCenter defaultCenter]
     postNotificationName:NOTICE_TIMER_ENDED object:nil];
}

- (void) timerEndedAction: (NSNotification *) notice
{
    NSLog(@"Notice from %@: The timer ended!", [notice name]);
}

- (id) init
{
    self = [super init];
    
    //[self initializeTimerEndedNotice];
    
    //Notification Center Testing
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(timerEndedAction:) name:NOTICE_TIMER_ENDED object:nil];
    return self;
}

- (void) dealloc
{
    // If you don't remove yourself as an observer, the Notification Center
    // will continue to try and send notification objects to the deallocated
    // object.
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
