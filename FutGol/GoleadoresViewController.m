//
//  GoleadoresViewController.m
//  FutGol
//
//  Created by 0x00 on 13/08/15.
//  Copyright (c) 2015 jesusnajar. All rights reserved.
//

#import "GoleadoresViewController.h"
#import "SWRevealViewController.h"
#import "Declarations.h"
#import "GoleadoresViewController.h"
#import "cellGoleadores.h"

@interface GoleadoresViewController ()

@end

@implementation GoleadoresViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController]; //carga la función initController
    self.title = @"Goleadores";
    
    
    
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
    
    maNombreGoleador            = [[NSMutableArray alloc] initWithObjects: @"Jesus", @"Cristian",@"Brian", @"Diego",@"Brayant",nil];
    maEquipo             = [[NSMutableArray alloc] initWithObjects: @"Guadalajara", @"Morelia", @"Guadalajara", @"Atlas", @"America",nil];
    maGoles             = [[NSMutableArray alloc] initWithObjects: @"10", @"4", @"3", @"3", @"2",nil];
    
    maimgGoleador             = [[NSMutableArray alloc] initWithObjects: @"jugador-color.png", @"jugador-color.png", @"jugador-color.png", @"jugador-color.png", @"jugador-color.png",nil];
   // maimgEquipo             = [[NSMutableArray alloc] initWithObjects: @"Chivas.png", @"Pumas.png", @"Chivas.png", @"Atlas.png", @"America.png",nil];
    
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
    return maNombreGoleador.count;
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
    cellGoleadores *cell = (cellGoleadores *)[tableView dequeueReusableCellWithIdentifier:@"cellGoleadores"];
    
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellGoleadores" bundle:nil] forCellReuseIdentifier:@"cellGoleadores"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellGoleadores"];
    }
    //Fill cell with info from arrays
   
    cell.lblNombreGoleador.text   = maNombreGoleador[indexPath.row];
    cell.lblEquipo.text           = maEquipo[indexPath.row];
    cell.lblGoles.text            = maGoles[indexPath.row];
    
    cell.imgGoleador.image = [UIImage imageNamed: maimgGoleador[indexPath.row]];
   // cell.imgEquipo.image   = [UIImage imageNamed: maimgEquipo[indexPath.row]];

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
