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
    mstPlayerPhoto = [[NSMutableArray alloc] init];
    mstPlayerName = [[NSMutableArray alloc] init];
    mstPlayerTeam = [[NSMutableArray alloc] init];
    mstPlayerGoals = [[NSMutableArray alloc] init];
    [self initData];
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

- (void)initData {
    NSMutableArray *jsonResponse = [TableGoalsDec getTableGoals];
    [ParserTableGoals parseTableGoals:jsonResponse];
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
    return mstPlayerName.count;
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

    cell.lblNombreGoleador.text   = mstPlayerName[indexPath.row];
    cell.lblEquipo.text           = mstPlayerTeam[indexPath.row];
    cell.lblGoles.text            = mstPlayerGoals[indexPath.row];
    
    NSData *imageData = [self dataFromBase64EncodedString:mstPlayerPhoto[indexPath.row]];
    UIImage *playerPhoto = [UIImage imageWithData:imageData];
    
    cell.imgGoleador.image = playerPhoto;

    return cell;
    
}
//-------------------------------------------------------------------------------
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
