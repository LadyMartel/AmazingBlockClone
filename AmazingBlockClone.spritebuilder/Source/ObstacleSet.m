//
//  ObstacleSet.m
//  AmazingBlockClone
//
//  Created by Rose on 8/18/14.
//  Copyright 2014 Apportable. All rights reserved.
//

#import "ObstacleSet.h"


@implementation ObstacleSet{
    CCNodeColor* _left;
    CCNodeColor* _right;
    CCNodeColor* _block;
}


-(void)didLoadFromCCB{
    [self randomXAlignment];
}
-(void)onEnter{
    [super onEnter];
    _left.physicsBody.collisionType = @"obstacle";
    _right.physicsBody.collisionType = @"obstacle";
    _block.physicsBody.collisionType = @"obstacle";
}

-(void)changeSpeed: (CGPoint) speed{
    [_left.physicsBody setVelocity:speed];
    [_right.physicsBody setVelocity:speed];
    [_block.physicsBody setVelocity:speed];
}

-(void)resetYPosition{
    [_left setPositionInPoints:ccp(_left.positionInPoints.x, _left.positionInPoints.y + 900)];
    [_right setPositionInPoints:ccp(_right.positionInPoints.x, _right.positionInPoints.y + 900)];
    [_block setPositionInPoints:ccp(_block.positionInPoints.x, _block.positionInPoints.y + 900)];
    [(MainScene* )[[self parent]parent] incrementScore];
}

-(void)randomXAlignment{
    int blockAlignment = arc4random() % 3;
    int leftAlignment = arc4random() % 3;
    
    float leftXPosition = -100 + leftAlignment * 50;
    float rightXPosition = leftXPosition + _left.contentSizeInPoints.width + 90;
    float blockXPosition = leftXPosition + _left.contentSizeInPoints.width + blockAlignment * 30;
    
    
    [_left setPositionInPoints:ccp(leftXPosition, _left.positionInPoints.y)];
    [_right setPositionInPoints:ccp(rightXPosition, _right.positionInPoints.y)];
    [_block setPositionInPoints:ccp(blockXPosition, _block.positionInPoints.y)];

}

-(void)update:(CCTime)delta{
    if ( [self convertToWorldSpace: _block.positionInPoints].y <= 0){
        [self randomXAlignment];
        [self resetYPosition];
    }
}



@end
