    //
//  ViewController.m
//  ColorFinder
//
//  Created by Franks, Kent Eric on 6/14/16.
//  Copyright © 2016 KefBytes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
    @property (weak, nonatomic) IBOutlet UITextField *redTextField;
    @property (weak, nonatomic) IBOutlet UITextField *greenTextField;
    @property (weak, nonatomic) IBOutlet UITextField *blueTextField;
    @property (weak, nonatomic) IBOutlet UITextField *alphaTextField;
    @property (weak, nonatomic) IBOutlet UIView *colorView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:self.redTextField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:self.greenTextField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:self.blueTextField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textFieldDidChange:) name:UITextFieldTextDidChangeNotification object:self.alphaTextField];
}

- (void)textFieldDidChange:(NSNotification *)notification {

    float redFloat = [self.redTextField.text floatValue];
    float greenFloat = [self.greenTextField.text floatValue];
    float blueFloat = [self.blueTextField.text floatValue];
    float alphaFloat;
    if ([self.alphaTextField.text isEqualToString:@""] || [self.alphaTextField.text isEqualToString:@"0"] || [self.alphaTextField.text isEqualToString:@"0."] || [self.alphaTextField.text isEqualToString:@"."]) {
        alphaFloat = 1.0;
    } else {
        alphaFloat = [self.alphaTextField.text floatValue];
    }
    
    self.colorView.backgroundColor = [UIColor colorWithRed:redFloat/255 green:greenFloat/255 blue:blueFloat/255 alpha:alphaFloat];
}



@end
