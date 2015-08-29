//
//  PosicionesViewController.m
//  FutGol
//
//  Created by 0x00 on 13/08/15.
//  Copyright (c) 2015 jesusnajar. All rights reserved.
//

#import "PosicionesViewController.h"
#import "SWRevealViewController.h"
#import "Declarations.h"
#import "PosicionesViewController.h"
#import "CellPosiciones.h"

@interface PosicionesViewController ()

@end

@implementation PosicionesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController]; //carga la función initController
    self.title = @"Posiciones";
    
    
    
    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Inicia el array

//-------------------------------------------------------------------------------
- (void)initController {
    maPosicion            = [[NSMutableArray alloc] initWithObjects: @"1", @"2",@"3", @"4",@"5",@"6",@"7",@"8",@"9",@"10",nil];
    maEquipos             = [[NSMutableArray alloc] initWithObjects: @"Guadalajara", @"Morelia", @"Pumas", @"Atlas", @"America", @"Pachuca", @"Tigres", @"Cruz Azul",@"Santos",@"Puebla",nil];
    maImgsEquipos         = [[NSMutableArray alloc] initWithObjects: @"Chivas.png", @"Morelia.png", @"Pumas.png", @"Atlas.png", @"America.png", @"Pachuca.png", @"Tigres.png", @"Cruz azul.png",@"Santos.png",@"Puebla.png",nil];
    
    maPuntos              = [[NSMutableArray alloc] initWithObjects: @"10", @"9",@"9", @"8",@"8",@"7",@"6",@"5",@"4",@"2",nil];
    maJugados             = [[NSMutableArray alloc] initWithObjects: @"4", @"4",@"4",@"4",@"4",@"4",@"4",@"4",@"4",@"4",nil];
    maGanados             = [[NSMutableArray alloc] initWithObjects: @"3", @"3",@"3",@"2",@"2",@"2",@"2",@"1",@"1",@"0",nil];
    maEmpatados             = [[NSMutableArray alloc] initWithObjects: @"1", @"0",@"0",@"2",@"2",@"1",@"0",@"2",@"1",@"2",nil];
    maPerdidos             = [[NSMutableArray alloc] initWithObjects: @"0", @"0",@"0",@"0",@"0",@"0",@"0",@"1",@"2",@"2",nil];
    

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
    return maEquipos.count;
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
    CellPosiciones *cell = (CellPosiciones *)[tableView dequeueReusableCellWithIdentifier:@"CellPosiciones"];
    
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"CellPosiciones" bundle:nil] forCellReuseIdentifier:@"CellPosiciones"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"CellPosiciones"];
    }
    //Fill cell with info from arrays
    cell.lblPosicion.text  =maPosicion[indexPath.row];
    cell.lblEquipos.text   = maEquipos[indexPath.row];
    cell.imgsEquipos.image = [UIImage imageNamed: maImgsEquipos[indexPath.row]];
    cell.lblPuntos.text   = maPuntos[indexPath.row];
    cell.lblJugados.text  = maJugados[indexPath.row];
    cell.lblGanados.text  = maGanados[indexPath.row];
    cell.lblEmpatados.text= maEmpatados[indexPath.row];
    cell.lblPerdidos.text = maPerdidos[indexPath.row];
    
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

@end
