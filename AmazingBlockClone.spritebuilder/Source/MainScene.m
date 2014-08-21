//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"
#import "Player.h"
#import "ObstacleSet.h"
#import "GameoverScene.h"

@implementation MainScene{
    Player * _player;
    CCPhysicsNode* _physicsNode;
    CCLabelTTF* _scoreLabel;
    NSArray * _obstacles; // Contains 3 obstacle sets
    float width;
    float height;
    int _score;

}
-(id)init{
    if (self = [super init]){

    }
    return self;
}


-(void)incrementScore{
    _score++;
    _scoreLabel.string = [NSString stringWithFormat: @"Score: %d", _score];
}

-(void)didLoadFromCCB{
    self.userInteractionEnabled = TRUE;
    width = [[CCDirector sharedDirector]viewSize].width;
    height = [[CCDirector sharedDirector]viewSize].height;
    _obstacles = [[NSArray alloc]initWithObjects:
                  (ObstacleSet *)[CCBReader load:@"ObstacleSet"],
                  (ObstacleSet *)[CCBReader load:@"ObstacleSet"],
                  (ObstacleSet *)[CCBReader load:@"ObstacleSet"], nil];
    
    _physicsNode.collisionDelegate = self; 
}

-(void)onEnter{
    [super onEnter];
    
    ObstacleSet * obstacle;
    for (int i = 0; i < 3; i++){
        obstacle = [_obstacles objectAtIndex:i];
        [obstacle setPositionInPoints:ccp(0,height + i * 300)];
        [_physicsNode addChild:obstacle];
    }
}

-(void)update:(CCTime)delta{
    ObstacleSet * obstacle;
    float scrollSpeed = 0;
    
    // Death Condition
    if(_player.positionInPoints.y <= 0){
        [self gameOver];
    }else if(_player.positionInPoints.y >= height/2 && _player.physicsBody.velocity.y >= 0){
//        scrollSpeed = -_player.physicsBody.velocity.y;
    }else if(_player.positionInPoints.y >= 5 * height/8){
//        scrollSpeed = -50;
    }
    
    for (int i = 0; i < 3; i++){
        obstacle = [_obstacles objectAtIndex:i];
        [obstacle changeSpeed:ccp(0, scrollSpeed)];
    }
    
}

-(BOOL)ccPhysicsCollisionBegin:(CCPhysicsCollisionPair *)pair player:(CCNode *)nodeA obstacle:(CCNode *)nodeB{
    [self gameOver];
    return true;
}

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    if(touch.locationInWorld.x < width/2){
        [_player fly:-1];
    }else{
        [_player fly:1];
    }
}

-(void)gameOver{
    [[CCDirector sharedDirector]replaceScene: [CCBReader loadAsScene:@"GameoverScene"]];
}

@end
