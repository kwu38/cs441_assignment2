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
@synthesize label, scoreLabel, tile1, tile2, tile3, tile4,
tile5, tile6, tile7, tile8,
tile9, tile10, tile11, tile12,
tile13, tile14, tile15, tile16;
NSMutableArray *firstRow, *secondRow, *thirdRow, *fourthRow, *board;
NSUInteger table[4][4];
int score;

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
    score = 0;
    [scoreLabel setText:@"0"];
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            [board[i][j] setText:@"0"];
            table[i][j] = 0;
        }
    }
   /* int counter = 1;
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++){
            NSString* string1 = [NSString stringWithFormat:@"%d",counter];
            [board[i][j] setText:string1];
            table[i][j] = counter;
            counter++;
        }
    }*/
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
    score = 0;
    [scoreLabel setText:@"0"];
    [self changeColors];
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
    if(table[row][column] != 0){
    while(true){
        row = arc4random_uniform(4);
        column = arc4random_uniform(4);
        if(table[row][column] == 0)
            break;
        }
    }
    [board[row][column] setText:string1];
    table[row][column] = [string1 integerValue];
    
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

-(void) endGame
{
    Boolean hasPair = [self stillHasPair];
    if(!hasPair){
        [self rotateBoard90:table];
        hasPair = [self stillHasPair];
        if(!hasPair){
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"GAME OVER!"
                                                                           message:@"Better luck next time."
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {}];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
            [self viewDidLoad];
        }
        else{
            [self rotateBoard90:table];
            [self rotateBoard90:table];
            [self rotateBoard90:table];
        }
    }
    
}
-(void)changeColors
{
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 4; j++)
        {
            switch(table[i][j]){
                case 0:
                    ((UILabel* )board[i][j]).backgroundColor = [UIColor whiteColor];
                    break;
                case 2:
                    ((UILabel* )board[i][j]).backgroundColor = [UIColor greenColor];
                    break;
                case 4:
                    ((UILabel* )board[i][j]).backgroundColor = [UIColor blueColor];
                    break;
                case 8:
                    ((UILabel* )board[i][j]).backgroundColor = [UIColor yellowColor];
                    break;
                case 16:
                    ((UILabel* )board[i][j]).backgroundColor = [UIColor magentaColor];
                    break;
                case 32:
                    ((UILabel* )board[i][j]).backgroundColor = [UIColor orangeColor];
                    break;
                case 64:
                    ((UILabel* )board[i][j]).backgroundColor = [UIColor purpleColor];
                    break;
                case 128:
                    ((UILabel* )board[i][j]).backgroundColor = [UIColor cyanColor];
                    break;
                case 256:
                    ((UILabel* )board[i][j]).backgroundColor = [UIColor brownColor];
                    break;
                case 512:
                    ((UILabel* )board[i][j]).backgroundColor = [UIColor darkGrayColor];
                    break;
                case 1024:
                    ((UILabel* )board[i][j]).backgroundColor = [UIColor lightGrayColor];
                    break;
                case 2048:
                    ((UILabel* )board[i][j]).backgroundColor = [UIColor redColor];
                    break;
            }
        }
    }
}
-(int) findNextPos:(NSUInteger[4]) row indexNumber:(int)index stopNumber:(int)flag displayArray:(NSMutableArray*) board
{
    int t;
    if(index == 0)
        return index;
    for(t=index-1;;t--){
        if(row[t] !=0){
            if(row[t] != row[index]){
                return t + 1;
            }
            return t;
        }
        else{
            if(t == flag){
                return t;
            }
        }
    }
    return index;
    
}

-(BOOL) slideArrayLeft:(NSUInteger[4]) singleRow displayRow:(NSMutableArray*) board
{
    Boolean success = false;
    int t, flag = 0;
    
    for(int x = 0; x < 4; x++){
        if(singleRow[x] != 0 )
        {
            t = [self findNextPos:(NSUInteger*)singleRow indexNumber:(int) x stopNumber:(int)flag displayArray:(NSMutableArray*) board];
            if(t != x){
                if(singleRow[t] == 0){
                    singleRow[t] = singleRow[x];
                    [board[t] setText: [NSString stringWithFormat:@"%lu",singleRow[t]]];
                }
                else if(singleRow[t] == singleRow[x]){
                    singleRow[t]+= singleRow[x];
                    [board[t] setText: [NSString stringWithFormat:@"%lu",singleRow[t]]];
                    score += singleRow[t];
                    flag = t + 1;
                }
                singleRow[x] = 0;
                [board[x] setText: [NSString stringWithFormat:@"%d", 0]];
                success = true;
            }
        }
        
    }
    return success;
}

-(BOOL) slideWholeBoard
{
    Boolean success = false;
    for(int i = 0; i < 4; i++)
    {
        success |= [self slideArrayLeft:table[i] displayRow:board[i]];
    }
    [scoreLabel setText: [NSString stringWithFormat:@"%d", score]];
    return success;
}

-(void) slideWholeBoardLeft
{
    Boolean success = [self slideWholeBoard];
    if(success)
        [self spawnTile];
    [self endGame];
    [self changeColors];
}
-(void) slideWholeBoardRight
{
    [self rotateBoard90:table];
    [self rotateBoard90:table];
    Boolean success = [self slideWholeBoard];
    [self rotateBoard90:table];
    [self rotateBoard90:table];
    if(success)
        [self spawnTile];
    [self endGame];
    [self changeColors];
    
}

-(void) slideWholeBoardDown
{
    [self rotateBoard90:table];
    [self rotateBoard90:table];
    [self rotateBoard90:table];
    Boolean success = [self slideWholeBoard];
    [self rotateBoard90:table];
    if(success)
        [self spawnTile];
    [self endGame];
    [self changeColors];
}

-(void) slideWholeBoardUp
{
    [self rotateBoard90:table];
    Boolean success = [self slideWholeBoard];
    [self rotateBoard90:table];
    [self rotateBoard90:table];
    [self rotateBoard90:table];
    if(success)
        [self spawnTile];
    [self endGame];
    [self changeColors];
   
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

-(BOOL) stillHasPair
{
    Boolean has = false;
    for(int i = 0; i < 4; i++){
        for(int j = 0; j < 3; j++){
            if(table[i][j] == table[i][j+1])
                return true;
        }
    }
    return has;
}
-(IBAction)doSomething: (id) sender
{
    UIButton *button = (UIButton *)sender;
    switch(button.tag){
        case 0:
            [self slideWholeBoardUp];
            break;
        case 1:
            [self slideWholeBoardDown];
            break;
        case 2:
            [self slideWholeBoardLeft];
            break;
        case 3:
            [self slideWholeBoardRight];
            break;
        default:
            break;
    }
}

@end
