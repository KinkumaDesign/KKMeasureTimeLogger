//
//  KKDetailViewController.m
//  KKMeasureTimeLoggerSample
//
//  Created by Maeda Tasuku on 1/11/13.
//  Copyright (c) 2013 KinkumaDesign. All rights reserved.
//

#import "KKDetailViewController.h"
#import "KKMeasureTimeLogger.h"

@interface KKDetailViewController ()

@end

@implementation KKDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [KKMeasureTimeLogger lap:@"detail view did load"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = @"Detail View";
    
    [KKMeasureTimeLogger lap:@"detail view view will appear"];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [KKMeasureTimeLogger lap:@"detail view view did appear"];
    [KKMeasureTimeLogger stop];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
