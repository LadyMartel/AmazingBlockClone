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
    CGRect frame = CGRectMake([[CCDirector sharedDirector] viewSize].width/2 - 50, [[CCDirector sharedDirector] viewSize].height/2 + 5, 112.5, 55);
    
    myButton = [[FUIButton alloc]initWithFrame:frame];

    
    myButton.buttonColor = [UIColor turquoiseColor];
    myButton.shadowColor = [UIColor greenSeaColor];
    myButton.shadowHeight = 3.0f;
    myButton.cornerRadius = 6.0f;
    myButton.titleLabel.font = [UIFont boldFlatFontOfSize:16];
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
