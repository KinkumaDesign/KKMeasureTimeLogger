//
//  KKMeasureTimeLogger.h
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

#import <Foundation/Foundation.h>

typedef enum : NSInteger{
    KKMeasureTimeLogModeAtOnce  = 2 << 0, //show log when method lap is fired
    KKMeasureTimeLogModeAfter   = 2 << 1  //show log when method stop is fired
} KKMeasureTimeLogMode;

@interface KKMeasureTimeLogger : NSObject
@property (nonatomic, strong, readonly) NSDate *initialDate;
@property (nonatomic, strong, readonly) NSDate *elapsedDate;
@property (nonatomic, assign, readonly) KKMeasureTimeLogMode logMode;

/*
 * You have to start from this method.
 */
+ (void)startWithLogMode:(KKMeasureTimeLogMode)aLogMode;

/*
 * Use this when you want to measure a lap.
 */
+ (void)lap:(NSString *)message;

/*
 * Use this when the measure is finished.
 */
+ (void)stop;
@end
