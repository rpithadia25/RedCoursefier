//
//  RPViewController.m
//  TableExample
//
//  Created by Rakshit Pithadia on 5/31/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import "RPViewController.h"

@interface RPViewController ()

@end

@implementation RPViewController{
    NSDictionary *details;
    NSArray *justNames;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return details.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    //create new cell
    //UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    //Using reusable cells... Very efficient if we have too many (100 or more) rows
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    //fill cell
    cell.textLabel.text = justNames[indexPath.row];
    
    return cell;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"version" withExtension:@"plist"];

    //load the plist into dictionsry
    details = [NSDictionary dictionaryWithContentsOfURL:url];
    
    //create an array with just the keys
    justNames = details.allKeys;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
