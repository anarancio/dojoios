//
//  MainViewController.m
//  dojoiOS
//
//  Created by Alejandro Narancio on 6/16/13.
//  Copyright (c) 2013 Alejandro Narancio. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)testNSString:(id)sender {
    NSString *testStr = @"test";
    NSLog(@"%i", [testStr lastIndexOf:@"t"]);
    NSLog(@"%i", [testStr lastIndexOf:@"a"]);
}

@end
