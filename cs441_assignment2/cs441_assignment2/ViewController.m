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
NSUInteger table[4][4];

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
    
    int counter = 1;
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            NSString* string1 = [NSString stringWithFormat:@"%d",counter];
            [board[i][j] setText:string1];
            table[i][j] = counter;
            counter++;
        }
    }
    
}

-(IBAction)intializeBoard: (id)sender
{
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            [board[i][j] setText:@"0"];
            table[i][j] = 0;
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
    table[row][column] = [string1 integerValue];
    table[row2][column2] = [string2 integerValue];
    //[self testPrint];
    
}

-(void) testPrint
{
    NSUInteger arr [4][4] = {{1, 2, 3, 4},
        {5, 6, 7, 8},
        {9,10, 11, 12},
        {13, 14, 15, 16}
    };
    [self rotateBoard90:arr];
    
    NSLog(@"{");
    for(int i = 0;i<4;i++)
    {
        NSLog(@"{");
        for(int j=0;j<4;j++)
        {
            NSLog(@"%lu, ",arr[i][j]);
        }
        NSLog(@"},");
    }
    NSLog(@"}");
    
}
-(void) spawnTile
{
    int row = arc4random_uniform(4);
    int column = arc4random_uniform(4);
    NSString* string1 = [self returnTwoOrFour];
    if(table[row][column] == 0){
        [board[row][column] setText:string1];
        table[row][column] = [string1 integerValue];
    }
}
-(NSString*) returnTwoOrFour
{
    int random = arc4random_uniform(2);
        if(random == 0)
            return [NSString stringWithFormat:@"%d",2];
        else return [NSString stringWithFormat:@"%d",4];
    
}

-(BOOL) isFull
{
    Boolean full = true;
    
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            if(table[i][j] != 0)
                full = false;
        }
    }
    return full;
}

-(BOOL) slideArrayLeft:(NSMutableArray*) singleRow
{
    Boolean success = false;
        
    return success;
}
// https://www.geeksforgeeks.org/inplace-rotate-square-matrix-by-90-degrees/
-(void) rotateBoard90:(NSUInteger[4][4]) table
{
    for(int i = 0; i < 4/2; i++){
        for(int j = i; j < 4-i-1; j++){
            NSUInteger temp = table[i][j];
            table[i][j] = table[j][4-1-i];
            [board[i][j] setText:[NSString stringWithFormat:@"%lu",table[j][4-1-i]]];
            table[j][4-1-i] = table[4-1-i][4-1-j];
            [board[j][4-1-i] setText:[NSString stringWithFormat:@"%lu",table[4-1-i][4-1-j]]];
            table[4-1-i][4-1-j] = table[4-1-j][i];
            [board[4-1-i][4-1-j] setText:[NSString stringWithFormat:@"%lu",table[4-1-j][i]]];
            table[4-1-j][i] = temp;
            [board[4-1-j][i] setText:[NSString stringWithFormat:@"%lu",temp]];
        }
    }
}
-(IBAction)doSomething: (id) sender
{
    UIButton *button = (UIButton *)sender;
    switch(button.tag){
        case 0:
            [self rotateBoard90:table];
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
