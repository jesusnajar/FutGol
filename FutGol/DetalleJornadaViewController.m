//
//  DetalleJornadaViewController.m
//  FutGol
//
//  Created by 0x00 on 15/08/15.
//  Copyright (c) 2015 jesusnajar. All rights reserved.
//

#import "DetalleJornadaViewController.h"
#import "Declarations.h"
#import "cellDetalleJornada.h"


@interface DetalleJornadaViewController ()

@end

@implementation DetalleJornadaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController]; //carga la función initController
     self.title = @"Jornadas";
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Inicia el array

//-------------------------------------------------------------------------------
- (void)initController {
    
    maGolesLocal             = [[NSMutableArray alloc] initWithObjects: @"5", @"2",@"2", @"1",nil];
    maGolesVisitante         = [[NSMutableArray alloc] initWithObjects: @"0", @"2",@"1", @"3",nil];

    
    maEquipoLocal            =[[NSMutableArray alloc] initWithObjects: @"Guadalajara", @"Morelia", @"Pumas", @"Atlas",nil];
    
    maEquipoVisitante        =[[NSMutableArray alloc] initWithObjects: @"America", @"Pachuca", @"Tigres", @"Cruz Azul",@"Santos",@"Puebla",nil];
    
    maImgEquipoLocal         = [[NSMutableArray alloc] initWithObjects: @"Chivas.png", @"Morelia.png", @"Pumas.png", @"Atlas.png",nil];
    
    maImgEquipoVisitante     = [[NSMutableArray alloc] initWithObjects: @"America.png", @"Pachuca.png", @"Tigres.png", @"Cruz azul.png",@"Santos.png",@"Puebla.png",nil];
    
    
    
    
}
/**********************************************************************************************/
#pragma mark - Table source and delegate methods
/**********************************************************************************************/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//-------------------------------------------------------------------------------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return maEquipoLocal.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
//-------------------------------------------------------------------------------
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Initialize cells
    cellDetalleJornada *cell = (cellDetalleJornada *)[tableView dequeueReusableCellWithIdentifier:@"cellDetalleJornada"];
    
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellDetalleJornada" bundle:nil] forCellReuseIdentifier:@"cellDetalleJornada"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellDetalleJornada"];
    }
    //Fill cell with info from arrays
 
    
    cell.lblEquipoLocal.text         =maEquipoLocal[indexPath.row];
    cell.lblGolesLocal.text          =maGolesLocal[indexPath.row];
    cell.imgEquipoLocal.image        = [UIImage imageNamed: maImgEquipoLocal[indexPath.row]];
    
    cell.lblEquipoVisitante.text     =maEquipoVisitante[indexPath.row];
    cell.imgEquipoVisitante.image    = [UIImage imageNamed: maImgEquipoVisitante[indexPath.row]];
    cell.lblGolesVisitante.text      =maGolesVisitante[indexPath.row];
    
    cell.lblEquipoLocal.adjustsFontSizeToFitWidth = YES;
    cell.lblEquipoVisitante.adjustsFontSizeToFitWidth = YES;

    
    return cell;
    
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnAtras:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
