//
//  PosicionesViewController.h
//  FutGol
//
//  Created by 0x00 on 13/08/15.
//  Copyright (c) 2015 jesusnajar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TablePositionsDec.h"
#import "ParserTablePositions.h"

@interface PosicionesViewController : UIViewController
@property (nonatomic,strong)    TablePositionsDec            *TablePositionsDesc;
@property (nonatomic,strong)    ParserTablePositions         *ParserTablePositions;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sidebarButton;

@end
