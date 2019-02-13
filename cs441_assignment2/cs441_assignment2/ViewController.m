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
@synthesize label, tile1, tile2, tile3, tile4,
tile5, tile6, tile7, tile8,
tile9, tile10, tile11, tile12,
tile13, tile14, tile15, tile16;
NSMutableArray *firstRow, *secondRow, *thirdRow, *fourthRow, *board;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    up.tag = 0;
    down.tag = 1;
    left.tag = 2;
    right.tag = 3;
    
    board = [[NSMutableArray alloc] init];
    firstRow = [[NSMutableArray alloc] init];
    secondRow = [[NSMutableArray alloc] init];
    thirdRow = [[NSMutableArray alloc] init];
    fourthRow = [[NSMutableArray alloc] init];

    [firstRow addObject:tile1];
    [firstRow addObject:tile2];
    [firstRow addObject:tile3];
    [firstRow addObject:tile4];
    [secondRow addObject:tile5];
    [secondRow addObject:tile6];
    [secondRow addObject:tile7];
    [secondRow addObject:tile8];
    [thirdRow addObject:tile9];
    [thirdRow addObject:tile10];
    [thirdRow addObject:tile11];
    [thirdRow addObject:tile12];
    [fourthRow addObject:tile13];
    [fourthRow addObject:tile14];
    [fourthRow addObject:tile15];
    [fourthRow addObject:tile16];
    [board addObject:firstRow];
    [board addObject:secondRow];
    [board addObject:thirdRow];
    [board addObject:fourthRow];
    
}

-(IBAction)intializeBoard: (id)sender
{
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            [board[i][j] setText:@"0"];
        }
    }
    
    int row = arc4random_uniform(4);
    int column = arc4random_uniform(4);
    int row2 = arc4random_uniform(4);
    int column2 = arc4random_uniform(4);
    while(row2 == row && column2 == column){
        row2 = arc4random_uniform(4);
        column2 = arc4random_uniform(4);
    }
    //NSLog(@"%d", row);
    NSString* string1 = [self returnTwoOrFour];
    NSString* string2 = [self returnTwoOrFour];
    
    [board[row][column] setText:string1];
    [board[row2][column2] setText:string2];
    
}
-(NSString*) returnTwoOrFour
{
    int random = arc4random_uniform(2);
        if(random == 0)
            return [NSString stringWithFormat:@"%d",2];
        else return [NSString stringWithFormat:@"%d",4];
    
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
