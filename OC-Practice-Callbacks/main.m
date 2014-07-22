//
//  main.m
//  OC-Practice-Callbacks
//
//  Created by Chase Gosingtian on 7/17/14.
//  Copyright (c) 2014 KLab Cyscorpions, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Stopwatch.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        Stopwatch *stopwatch = [[Stopwatch alloc] init];

        [stopwatch startTimer];
        
        //NOTE: Anything below this will NOT HAPPEN because the timer is still going in stopwatch
        //Notification Center Testing
        [[NSNotificationCenter defaultCenter]
         addObserver:stopwatch
            selector:@selector(timerEndedAction:)
                name:NOTICE_TIMER_ENDED
              object:nil];

    }
    return 0;
}
