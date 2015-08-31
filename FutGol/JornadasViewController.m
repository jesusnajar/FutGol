//
//  JornadasViewController.m
//  FutGol
//
//  Created by 0x00 on 13/08/15.
//  Copyright (c) 2015 jesusnajar. All rights reserved.
//

#import "JornadasViewController.h"
#import "SWRevealViewController.h"
#import "Declarations.h"
#import "cellJornadas.h"
#import "DetalleJornadaViewController.h"

@interface JornadasViewController ()

@end

@implementation JornadasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    mstNumbers = [[NSMutableArray alloc] init];
    mstForeignGoals = [[NSMutableArray alloc] init];
    mstForeignLogo = [[NSMutableArray alloc] init];
    mstForeignName = [[NSMutableArray alloc] init];
    mstLocalGoals = [[NSMutableArray alloc] init];
    mstLocalLogo = [[NSMutableArray alloc] init];
    mstLocalName = [[NSMutableArray alloc] init];
    [self initData];
    [self initController]; //carga la función initController
    self.title = @"Jornadas";
    

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
    NSMutableArray *jsonResponse = [MatchesDesc getMatches];
    [ParserMatches parseMatches:jsonResponse];
}

//-------------------------------------------------------------------------------
- (void)initController {

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
    return mstNumbers.count;
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
    cellJornadas *cell = (cellJornadas *)[tableView dequeueReusableCellWithIdentifier:@"cellJornadas"];
    
   
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellJornadas" bundle:nil] forCellReuseIdentifier:@"cellJornadas"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellJornadas"];
    }
    //Fill cell with info from arrays
    
    cell.lblJornada.text          = [@"Jornada " stringByAppendingString:mstNumbers[indexPath.row]];
    cell.lblEstatusJornada.text          =@"Jugada";
    
    
    return cell;
    
    
}
//-------------------------------------------------------------------------------
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    miCellIndexJornada = (int)indexPath.row;
   
    DetalleJornadaViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"DetalleJornadaViewController"];
    
    [self presentViewController:viewController animated:YES completion:nil];
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
