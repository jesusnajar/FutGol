//
//  MainViewController.h
//  FutGol
//
//  Created by 0x00 on 12/08/15.
//  Copyright (c) 2015 jesusnajar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsDesc.h"
#import "ParserNews.h"

@interface MainViewController : UIViewController

@property (nonatomic,strong)    NewsDesc            *NewsDes;
@property (nonatomic,strong)    ParserNews         *ParserNews;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;


@end
