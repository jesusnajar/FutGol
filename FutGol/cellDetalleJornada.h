//
//  cellDetalleJornada.h
//  FutGol
//
//  Created by 0x00 on 15/08/15.
//  Copyright (c) 2015 jesusnajar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cellDetalleJornada : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgEquipoLocal;
@property (strong, nonatomic) IBOutlet UIImageView *imgEquipoVisitante;
@property (strong, nonatomic) IBOutlet UILabel *lblEquipoLocal;
@property (strong, nonatomic) IBOutlet UILabel *lblEquipoVisitante;
@property (strong, nonatomic) IBOutlet UILabel *lblGolesLocal;
@property (strong, nonatomic) IBOutlet UILabel *lblGolesVisitante;

@end
