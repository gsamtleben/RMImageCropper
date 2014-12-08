#import "RMViewController.h"

#import <RMImageCropper/RMImageCropper.h>

@interface RMViewController ()

@property (weak, nonatomic) IBOutlet RMImageCropper *imageCropper;
@property (weak, nonatomic) IBOutlet UIImageView *editedImageView;

@property (strong, nonatomic) NSTimer *timer;

@end

@implementation RMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:true];
    
    UIImage * image = [UIImage imageNamed:@"Charming-as-always-captain-jack-sparrow-32570197-578-506"];
    
    self.imageCropper.minimum = 100;
    self.imageCropper.image = image;
    self.imageCropper.initialScale = RMImageCropperModeAspectFill;
    self.imageCropper.minimumScale = RMImageCropperModeAspectFit;
    
    [self.view addSubview:_imageCropper];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(updateImage:) userInfo:nil repeats:true];
}

- (void)updateImage:(NSTimer *)timer
{
    [self.imageCropper editedImageAsync:^(UIImage *image) {
       
        self.editedImageView.image = image;
    }];
}

- (IBAction)takePicture:(id)sender
{
    UIButton *button = sender;
    
    if (self.imageCropper.minimumScale == RMImageCropperModeAspectFit)
    {
        self.imageCropper.minimumScale = RMImageCropperModeAspectFill;
        [button setTitle:@"Switch Minimum to Aspect Fit" forState:UIControlStateNormal];
    }
    else
    {
        self.imageCropper.minimumScale = RMImageCropperModeAspectFit;
        [button setTitle:@"Switch Minimum to Aspect Fill" forState:UIControlStateNormal];
    }
}

@end
