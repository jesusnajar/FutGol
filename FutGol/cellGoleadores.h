//
//  cellGoleadores.h
//  FutGol
//
//  Created by 0x00 on 14/08/15.
//  Copyright (c) 2015 jesusnajar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cellGoleadores : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblNombreGoleador;
@property (strong, nonatomic) IBOutlet UILabel *lblEquipo;
@property (strong, nonatomic) IBOutlet UILabel *lblGoles;


@property (strong, nonatomic) IBOutlet UIImageView *imgGoleador;
@property (strong, nonatomic) IBOutlet UIImageView *imgEquipo;
@end
