//
//  Player.m
//  AmazingBlockClone
//
//  Created by Rose on 8/19/14.
//  Copyright 2014 Apportable. All rights reserved.
//

#import "Player.h"
#import "CCPhysics+ObjectiveChipmunk.h"

@implementation Player

-(void)didLoadFromCCB{
    cpBodySetVelocityUpdateFunc(self.physicsBody.body.body, playerVelocityUpdate);
}
-(void)onEnter{
    [super onEnter];
    self.physicsBody.collisionType = @"player";
}

static void
playerVelocityUpdate(cpBody *body, cpVect gravity, cpFloat damping, cpFloat dt){
    cpBodyUpdateVelocity(body, gravity, damping, dt);
    cpVect bodyVelocity = ccp(cpBodyGetVelocity(body).x, cpBodyGetVelocity(body).y - 8);
    bodyVelocity.y = MAX(-300, MIN(bodyVelocity.y, 300));
    cpBodySetVelocity(body, bodyVelocity);
}

-(void)fly:(int)direction{
    [self.physicsBody setVelocity:ccp(0,0)];
    [self.physicsBody applyImpulse:ccp(direction * 10, 80)];
}

@end
