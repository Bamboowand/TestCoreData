//
//  ViewController.m
//  TestCoreData
//
//  Created by ChenWei on 2019/3/8.
//  Copyright © 2019年 Jacob. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"
#import "../AppDelegate.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    
    NSError *error = nil;
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Exam"];
    NSArray *result = [context executeFetchRequest:fetchRequest error:&error];
    if ( error != nil ) {
        NSLog(@"Error %@ %@", error, error.userInfo);
    }
    
    [examArray_ removeAllObjects];
    for (NSManagedObject *object in result) {
        [examArray_ addObject:object];
    }
    
    [self.tablevView reloadData];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tablevView.delegate = self;
    self.tablevView.dataSource = self;
    examArray_ = [[NSMutableArray<NSManagedObject *> alloc] init];
    
}

#pragma mark- UITableViewDataSource Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [examArray_ count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellName = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if ( !cell ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    cell.textLabel.text = [examArray_[indexPath.row] valueForKey:@"subject"];
    return cell;
}

#pragma mark- UITableViewCellDelegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}


- (IBAction)addAction:(UIBarButtonItem *)sender {
    DetailViewController *vc = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
@end
