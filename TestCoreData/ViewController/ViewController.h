//
//  ViewController.h
//  TestCoreData
//
//  Created by ChenWei on 2019/3/8.
//  Copyright © 2019年 Jacob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray<NSManagedObject *> *examArray_;
}

@property (weak, nonatomic) IBOutlet UITableView *tablevView;
- (IBAction)addAction:(UIBarButtonItem *)sender;

@end

