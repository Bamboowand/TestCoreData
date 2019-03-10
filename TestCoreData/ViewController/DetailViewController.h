//
//  DetailViewController.h
//  TestCoreData
//
//  Created by ChenWei on 2019/3/8.
//  Copyright © 2019年 Jacob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISwitch *switchButton;

- (IBAction)saveAction:(UIButton *)sender;


@end

NS_ASSUME_NONNULL_END
