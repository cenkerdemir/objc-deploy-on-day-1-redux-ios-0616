//
//  FISTicTacToeGame.m
//  DeployOnDay1Redux
//
//  Created by Timothy Clem on 9/22/15.
//  Copyright © 2015 The Flatiron School. All rights reserved.
//

#import "FISTicTacToeGame.h"

@interface FISTicTacToeGame ()

@property (nonatomic, strong) NSMutableArray *board;

@end


@implementation FISTicTacToeGame

/*
 
 00   |  01      | 02
-----------------------
 10   |  11      | 12
-----------------------
 20   |  21      | 22
 
*/

-(instancetype)init
{
    self = [super init];
    if(self) {
        // Do initialization of your game here, inside this if statement.
        // Leave the rest of this method alone :)
        
        //calling the resetboard function to clear the board with every initialization of the game
        [self resetBoard];
    }

    return self;
}

-(void)resetBoard
{
    NSArray *tempBoard = @[
                           [@[@"",@"",@""] mutableCopy],
                           [@[@"",@"",@""] mutableCopy],
                           [@[@"",@"",@""] mutableCopy]
                           ];
    self.board = [tempBoard mutableCopy];
}

//return the element in the col-row location of the board
-(NSString *)playerAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    return self.board[row][column];
}

// if the col-row element is an empty string then return YES. Otherwise, return NO
-(BOOL)canPlayAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    if([self.board[row][column] isEqualToString:@""]){
        return YES;
    }
    return NO;
}

-(void)playXAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    self.board[row][column] = @"X";
}

-(void)playOAtColumn:(NSUInteger)column row:(NSUInteger)row
{
    self.board[row][column] = @"O";
}

// used magic numbers but need to fix it later
-(NSString *)winningPlayer
{
    if(![self.board[0][0] isEqualToString:@""]) {
        if ( [self.board[0][0] isEqualToString:self.board[0][1]] && [self.board[0][0] isEqualToString:self.board[0][2]]) {
            return self.board[0][0];
        }
        if ( [self.board[0][0] isEqualToString:self.board[1][0]] && [self.board[0][0] isEqualToString:self.board[2][0]]) {
            return self.board[0][0];
        }
        if ( [self.board[0][0] isEqualToString:self.board[1][1]] && [self.board[0][0] isEqualToString:self.board[2][2]]) {
            return self.board[0][0];
        }
    }
    
    if(![self.board[1][0] isEqualToString:@""]) {
        if ( [self.board[1][0] isEqualToString:self.board[1][1]] && [self.board[1][0] isEqualToString:self.board[1][2]]) {
            return self.board[1][0];
        }
    }
    
    if(![self.board[2][0] isEqualToString:@""]) {
        if ( [self.board[2][0] isEqualToString:self.board[1][1]] && [self.board[2][0] isEqualToString:self.board[0][2]]) {
            return self.board[2][0];
        }
        if ( [self.board[2][0] isEqualToString:self.board[2][1]] && [self.board[2][0] isEqualToString:self.board[2][2]]) {
            return self.board[2][0];
        }
    }
    
    if(![self.board[0][1] isEqualToString:@""]) {
        if ( [self.board[0][1] isEqualToString:self.board[1][1]] && [self.board[0][1] isEqualToString:self.board[2][1]]) {
            return self.board[0][1];
        }
    }

    if(![self.board[0][2] isEqualToString:@""]) {
        if ( [self.board[0][2] isEqualToString:self.board[1][2]] && [self.board[0][2] isEqualToString:self.board[2][2]]) {
            return self.board[0][2];
        }
    }
    return @"";
}

-(BOOL)isADraw
{
    BOOL isBoardFull = YES;
    for (NSUInteger i = 0; i < 3; i++) {
        for (NSUInteger j = 0; j < 3; j++) {
            if([self.board[i][j] isEqualToString:@""]){
                isBoardFull = NO;
            }
        }
    }
    
    if ([[self winningPlayer] isEqualToString:@""] && isBoardFull) {
        return YES;
    }
    return NO;
}

@end
