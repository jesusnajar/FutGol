//
//  GoleadoresViewController.h
//  FutGol
//
//  Created by 0x00 on 13/08/15.
//  Copyright (c) 2015 jesusnajar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableGoalsDec.h"
#import "ParserTableGoals.h"

@interface GoleadoresViewController : UIViewController
@property (nonatomic,strong)    TableGoalsDec            *TableGoalsDes;
@property (nonatomic,strong)    ParserTableGoals         *ParserTableGoals;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@end
