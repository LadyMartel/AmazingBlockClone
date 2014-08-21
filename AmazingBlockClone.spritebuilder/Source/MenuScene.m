//
//  MenuScene.m
//  AmazingBlockClone
//
//  Created by Rose on 8/18/14.
//  Copyright 2014 Apportable. All rights reserved.
//

#import "MenuScene.h"


@implementation MenuScene{
    FUIButton * myButton;
}

-(void)didLoadFromCCB{
    
}

-(void)onEnter{
    [super onEnter];
    float scale = [[CCDirector sharedDirector]UIScaleFactor];
//    CGRect frame = CGRectMake([[CCDirector sharedDirector] viewSize].width/2 - 50, [[CCDirector sharedDirector] viewSize].height/2 + 5, 112.5, 55);
    
    float width = [[CCDirector sharedDirector]viewSize].width;
    float height = [[CCDirector sharedDirector]viewSize].height;
    
    float buttonWidth = 160 * 1/scale;
    float buttonHeight = 80 * 1/scale;
    
    CGRect frame = CGRectMake(width/2 * 1/scale - buttonWidth/2, height/2 * 1/scale - buttonHeight/2, buttonWidth,buttonHeight);
    

    
    myButton = [[FUIButton alloc]initWithFrame:frame];
    myButton.buttonColor = [UIColor turquoiseColor];
    myButton.shadowColor = [UIColor greenSeaColor];
    myButton.shadowHeight = 3.0f * 1/scale;
    myButton.cornerRadius = 6.0f * 1/scale;
    myButton.titleLabel.font = [UIFont boldFlatFontOfSize:24 * 1/scale];
    [myButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateNormal];
    [myButton setTitleColor:[UIColor cloudsColor] forState:UIControlStateHighlighted];
    
    [myButton setTitle:@"play" forState: UIControlStateNormal];
    [myButton addTarget:self
                 action:@selector(play)
       forControlEvents:UIControlEventTouchUpInside];
    [[[CCDirector sharedDirector]view] addSubview:myButton];
}

-(void)play{
    [[CCDirector sharedDirector]replaceScene:[CCBReader loadAsScene:@"MainScene"]];
    NSLog(@"Switching to MainScene");
    [myButton removeFromSuperview];
}

@end
