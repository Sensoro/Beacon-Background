//
//  ViewController.h
//  Background-OC
//
//  Created by David Yang on 15/3/24.
//  Copyright (c) 2015年 Sensoro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *actionButton;

- (IBAction)actionPress:(id)sender;

@end

