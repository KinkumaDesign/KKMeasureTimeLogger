//
//  KKMasterViewController.m
//  KKMeasureTimeLoggerSample
//
//  Created by Maeda Tasuku on 1/11/13.
//  Copyright (c) 2013 KinkumaDesign. All rights reserved.
//

#import "KKMasterViewController.h"
#import "KKMeasureTimeLogger.h"
#import "KKDetailViewController.h"

@interface KKMasterViewController ()

@end

@implementation KKMasterViewController


- (IBAction)buttonTapped:(id)sender
{
    //you have to start from this method
    [KKMeasureTimeLogger startWithLogMode:KKMeasureTimeLogModeAfter];

    [KKMeasureTimeLogger lap:@"button tapped in master view"];
    
    KKDetailViewController *detailViewController = [[KKDetailViewController alloc] initWithNibName:@"KKDetailViewController" bundle:nil];
    [self.navigationController pushViewController:detailViewController animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"Master View";
}

@end
