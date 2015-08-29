//
//  MainViewController.m
//  FutGol
//
//  Created by 0x00 on 12/08/15.
//  Copyright (c) 2015 jesusnajar. All rights reserved.
//

#import "MainViewController.h"
#import "SWRevealViewController.h"
#import "Declarations.h"
#import "cellNoticias.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController]; //carga la función initController
    self.title = @"Noticias";
    
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

//se agregaron estas lineas
//Inicia el array

//-------------------------------------------------------------------------------
- (void)initController {
        maNoticia             = [[NSMutableArray alloc] initWithObjects: @"Angel",nil];
        maImgNoticia          = [[NSMutableArray alloc] initWithObjects: @"noticia1.jpg",nil];
    
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
    return maNoticia.count;
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
    cellNoticias *cell = (cellNoticias *)[tableView dequeueReusableCellWithIdentifier:@"cellNoticias"];
    
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellNoticias" bundle:nil] forCellReuseIdentifier:@"cellNoticias"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellNoticias"];
    }
    //Fill cell with info from arrays
    tableView.rowHeight = 100;
    cell.lblNoticia.text   = maNoticia[indexPath.row];
    cell.imgNoticia.image = [UIImage imageNamed: maImgNoticia[indexPath.row]];
    
    
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
