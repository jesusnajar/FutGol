//
//  JornadasViewController.h
//  FutGol
//
//  Created by 0x00 on 13/08/15.
//  Copyright (c) 2015 jesusnajar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MatchesDesc.h"
#import "ParserMatches.h"

@interface JornadasViewController : UIViewController
@property (nonatomic,strong)    MatchesDesc            *MatchesDesc;
@property (nonatomic,strong)    ParserMatches         *ParserMatches;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@end
