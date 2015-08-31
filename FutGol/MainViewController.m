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
    mstNewsTitle = [[NSMutableArray alloc] init];
    mstNewsImg = [[NSMutableArray alloc] init];
    mstNewsContent = [[NSMutableArray alloc] init];
    [self initData];
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

- (void)initData {
    NSMutableArray *jsonResponse = [NewsDesc getNews];
    [ParserNews parseNews:jsonResponse];
}




//se agregaron estas lineas
//Inicia el array

//-------------------------------------------------------------------------------
- (void)initController {
        maNoticia             = [[NSMutableArray alloc] initWithObjects: @"Chivas mas juntos que nunca ",nil];
        maImgNoticia          = [[NSMutableArray alloc] initWithObjects: @"noticia_2.jpg",nil];
    
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
    return mstNewsTitle.count;
}
//-------------------------------------------------------------------------------
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
 /*
    CGRect frame = tableView.frame;
    frame.size = tableView.contentSize;
    tableView.frame = frame; */
    
    return 120;//regresa el tamaño
    
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
    cell.lblNoticia.text   = mstNewsContent[indexPath.row];
    
    NSData *imageData = [self dataFromBase64EncodedString:mstNewsImg[indexPath.row]];
    UIImage *imgNews = [UIImage imageWithData:imageData];
    
    imgNews = [self imageWithImage:imgNews scaledToSize: CGSizeMake(50, 50)];
    
    cell.imgNoticia.image = imgNews;
    
    
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

- (UIImage*)imageWithImage:(UIImage*)image
              scaledToSize:(CGSize)targetSize;

{
    UIImage *sourceImage = image;
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    
    if (CGSizeEqualToSize(imageSize, targetSize) == NO)
    {
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor > heightFactor) {
            scaleFactor = widthFactor; // scale to fit height
        }
        else{
            scaleFactor = heightFactor; // scale to fit width
        }
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        if (widthFactor > heightFactor)
        {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        }
        else
            if (widthFactor < heightFactor)
            {
                thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
            }
    }
    
    UIGraphicsBeginImageContext(targetSize); // this will crop
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if(newImage == nil)
        NSLog(@"could not scale image");
    
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    return newImage;
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
