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
    cellDetalleJornada *cell = (cellDetalleJornada *)[tableView dequeueReusableCellWithIdentifier:@"cellDetalleJornada"];
    
    
    if (cell == nil) {
        [tableView registerNib:[UINib nibWithNibName:@"cellDetalleJornada" bundle:nil] forCellReuseIdentifier:@"cellDetalleJornada"];
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellDetalleJornada"];
    }
    //Fill cell with info from arrays
 
    
    cell.lblEquipoLocal.text         =mstLocalName[indexPath.row];
    cell.lblGolesLocal.text          =mstLocalGoals[indexPath.row];
    
    NSData *imgData = [self dataFromBase64EncodedString:mstLocalLogo[indexPath.row]];
    UIImage *localLogo = [UIImage imageWithData:imgData];
    
    cell.imgEquipoLocal.image        = localLogo;
    
    cell.lblEquipoVisitante.text     =mstForeignName[indexPath.row];
    
    NSData *imageData = [self dataFromBase64EncodedString:mstForeignLogo[indexPath.row]];
    UIImage *foreignLogo = [UIImage imageWithData:imageData];
    
    cell.imgEquipoVisitante.image    = foreignLogo;
    cell.lblGolesVisitante.text      =mstForeignGoals[indexPath.row];
    
    cell.lblEquipoLocal.adjustsFontSizeToFitWidth = YES;
    cell.lblEquipoVisitante.adjustsFontSizeToFitWidth = YES;

    
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

- (IBAction)btnAtras:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
