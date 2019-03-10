//
//  DetailViewController.m
//  TestCoreData
//
//  Created by ChenWei on 2019/3/8.
//  Copyright © 2019年 Jacob. All rights reserved.
//

#import "DetailViewController.h"
#import "../AppDelegate.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//    if (@available(iOS 10.0, *)) {
//          AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    } else {
//        // Fallback on earlier versions
//    }

#pragma mark- Button Action Methods
- (IBAction)saveAction:(UIButton *)sender {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSEntityDescription *model = [NSEntityDescription entityForName:@"Exam" inManagedObjectContext:context];
    NSManagedObject *newExam = [[NSManagedObject alloc] initWithEntity:model insertIntoManagedObjectContext:context];
    
    [newExam setValue:self.textField.text forKey:@"subject"];
    [newExam setValue:[NSNumber numberWithBool: self.switchButton.on] forKey:@"isImportant"];
    // Save
    NSError *error = nil;
    if ( [context hasChanges] || ![context save:&error] ) {
        NSLog(@"Unresolved error: %@, %@", error, error.userInfo);
        abort();
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
