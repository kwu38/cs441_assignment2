//
//  ViewController.m
//  cs441_assignment2
//
//  Created by Kevin Wu on 2/11/19.
//  Copyright © 2019 Kevin Wu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize up, down, left, right;
@synthesize label;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(IBAction)doSomething: (id) sender
{
    [label setText:@"I love Java and Android!"];
}

@end
