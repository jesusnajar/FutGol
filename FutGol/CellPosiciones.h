//
//  CellPosiciones.h
//  FutGol
//
//  Created by 0x00 on 13/08/15.
//  Copyright (c) 2015 jesusnajar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellPosiciones : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblPosicion;
@property (strong, nonatomic) IBOutlet UIImageView *imgsEquipos;
@property (strong, nonatomic) IBOutlet UILabel *lblEquipos;
@property (strong, nonatomic) IBOutlet UILabel *lblPuntos;
@property (strong, nonatomic) IBOutlet UILabel *lblJugados;
@property (strong, nonatomic) IBOutlet UILabel *lblGanados;

@property (strong, nonatomic) IBOutlet UILabel *lblEmpatados;


@property (strong, nonatomic) IBOutlet UILabel *lblPerdidos;


@end
