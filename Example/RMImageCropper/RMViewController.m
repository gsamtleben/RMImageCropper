#import "RMViewController.h"

#import <RMImageCropper/RMImageCropper.h>

@interface RMViewController ()

@property (weak, nonatomic) IBOutlet RMImageCropper *imageEditor;
@property (weak, nonatomic) IBOutlet UIImageView *editedImageView;

@property (strong, nonatomic) NSTimer *timer;

@end

@implementation RMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:true];
    
    UIImage * image = [UIImage imageNamed:@"Charming-as-always-captain-jack-sparrow-32570197-578-506"];
    
    self.imageEditor.minimum = 100;
    self.imageEditor.image = image;
    self.imageEditor.initialScale = RMImageEditorModeAspectFill;
    self.imageEditor.minimumScale = RMImageEditorModeAspectFit;
    
    [self.view addSubview:_imageEditor];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01f target:self selector:@selector(updateImage:) userInfo:nil repeats:true];
    
    self.editedImageView.userInteractionEnabled = true;
    
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleMode:)];
    [self.editedImageView addGestureRecognizer:recognizer];
}

- (void)updateImage:(NSTimer *)timer
{
    self.editedImageView.image = self.imageEditor.editedImage;
}

- (void)toggleMode:(UITapGestureRecognizer *)recognizer
{
    if (self.imageEditor.minimumScale == RMImageEditorModeAspectFit)
    {
        self.imageEditor.minimumScale = RMImageEditorModeAspectFill;
    }
    else
    {
        self.imageEditor.minimumScale = RMImageEditorModeAspectFit;
    }
}
- (IBAction)takePicture:(id)sender
{
    if (self.imageEditor.initialScale == RMImageEditorModeAspectFit)
    {
        self.imageEditor.initialScale = RMImageEditorModeAspectFill;
    }
    else
    {
        self.imageEditor.initialScale = RMImageEditorModeAspectFit;
    }
}

@end
