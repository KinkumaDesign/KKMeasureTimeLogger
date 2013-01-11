//
//  KKMeasureTimeLogger.m
//
//  Created by Maeda Tasuku on 1/8/13.
//  Copyright (c) 2013 KinkumaDesign. All rights reserved.
//
//The MIT License (MIT)
//Copyright (c) <year> <copyright holders>
//
//Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "KKMeasureTimeLogger.h"

@implementation KKMeasureTimeLogger
{
    NSMutableString *_logMessage;
    BOOL _running;
}

+ (KKMeasureTimeLogger *)sharedInstance
{
    static KKMeasureTimeLogger *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[KKMeasureTimeLogger alloc] init];
    });
    return singleton;
}

+ (void)startWithLogMode:(KKMeasureTimeLogMode)aLogMode
{
    [[KKMeasureTimeLogger sharedInstance] startWithLogMode:aLogMode];
}

+ (void)lap:(NSString *)message
{
    [[KKMeasureTimeLogger sharedInstance] lap:message];
}

+ (void)stop
{
    [[KKMeasureTimeLogger sharedInstance] stop];
}

- (void)startWithLogMode:(KKMeasureTimeLogMode)aLogMode
{
    if(aLogMode == KKMeasureTimeLogModeAtOnce){
        NSLog(@"A measure has been started.");
    }else if(aLogMode == KKMeasureTimeLogModeAfter){
    }else{
        [NSException raise:@"argument error" format:@"Please check the LogMode argument."];
        return;
    }
    _logMessage = [[NSMutableString alloc] init];
    _initialDate = [NSDate date];
    _elapsedDate = [NSDate date];
    _logMode = aLogMode;
    _running = YES;
}

- (void)lap:(NSString *)message
{
    if(!_running){
        [NSException raise:@"You have to use startWithLogMode: method first." format:nil];
        return;
    }
    NSDate *now = [NSDate date];
    NSString *lapMessage = [NSString stringWithFormat:@"From start %f sec. From last lap %f sec <= %@", [now timeIntervalSinceDate:_initialDate], [now timeIntervalSinceDate:_elapsedDate], message];
    _elapsedDate = now;
    if(_logMode == KKMeasureTimeLogModeAfter){
        [_logMessage appendString:[NSString stringWithFormat:@"%@\n", lapMessage]];
    }else{
        NSLog(@"%@", lapMessage);
    }
}

- (void)stop
{
    if(_logMode == KKMeasureTimeLogModeAfter){
        NSLog(@"\n-- Time result\n%@", _logMessage);
    }else{
        NSLog(@"The measure has been stopped.");
    }
    _running = NO;
}
@end
