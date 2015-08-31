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
    mstTeamWons = [[NSMutableArray alloc] init];
    mstTeamPoints = [[NSMutableArray alloc] init];
    mstTeamLost = [[NSMutableArray alloc] init];
    mstTeamLogo = [[NSMutableArray alloc] init];
    mstTeamName = [[NSMutableArray alloc] init];
    mstTeamGoalsFavor = [[NSMutableArray alloc] init];
    mstTeamGoalsAgainst = [[NSMutableArray alloc] init];
    mstTeamGames = [[NSMutableArray alloc] init];
    mstTeamDrawns = [[NSMutableArray alloc] init];
    [self initData];
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

- (void)initData {
    NSMutableArray *jsonResponse = [TablePositionsDec getTablePositions];
    [ParserTablePositions parseTablePositions:jsonResponse];
}

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
    return mstTeamGames.count;
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
    cell.lblPosicion.text  = [NSString stringWithFormat:@"%ld",(long)indexPath.row + 1];
    cell.lblEquipos.text   = mstTeamName[indexPath.row];
    
    NSData *imageData = [self dataFromBase64EncodedString:mstTeamLogo[indexPath.row]];
    UIImage *teamLogo = [UIImage imageWithData:imageData];
    
    cell.imgsEquipos.image = teamLogo;
    cell.lblPuntos.text   = mstTeamPoints[indexPath.row];
    cell.lblJugados.text  = mstTeamGames[indexPath.row];
    cell.lblGanados.text  = mstTeamWons[indexPath.row];
    cell.lblEmpatados.text= mstTeamDrawns[indexPath.row];
    cell.lblPerdidos.text = mstTeamLost[indexPath.row];
    
    return cell;
    
}

-(NSData *)dataFromBase64EncodedString:(NSString *)string{
    if (string.length > 0) {
        
        //the iPhone has base 64 decoding built in but not obviously. The trick is to
        //create a data url that's base 64 encoded and ask an NSData to load it.
        NSString *data64URLString = [NSString stringWithFormat:@"data:;base64,%@", string];
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:data64URLString]];
        return data;
    }
    return nil;
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
