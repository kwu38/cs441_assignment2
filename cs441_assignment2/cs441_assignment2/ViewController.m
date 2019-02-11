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
    up.tag = 0;
    down.tag = 1;
    left.tag = 2;
    right.tag = 3;
}
-(IBAction)doSomething: (id) sender
{
    UIButton *button = (UIButton *)sender;
    switch(button.tag){
        case 0:
            [label setText:@"up"];
            break;
        case 1:
            [label setText:@"down"];
            break;
        case 2:
            [label setText:@"left"];
            break;
        case 3:
            [label setText:@"right"];
            break;
        default:
            break;
    }
}

@end
