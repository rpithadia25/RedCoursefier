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
    
    NSDictionary *moreDetails;
    NSArray *moreNames;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return details.count;
    }else{
        return moreDetails.count;
    }

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    //create new cell
    //UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    //Using reusable cells... Very efficient if we have too many (100 or more) rows
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    
    //To add cell icons
    //Retrieve an image
    UIImage *myImage = [UIImage imageNamed:@"DemoCellImage"];
    [cell.imageView setImage:myImage];
    
    //fill cell
    if (indexPath.section == 0) {
        cell.textLabel.text = justNames[indexPath.row];
        cell.detailTextLabel.text = details[justNames[indexPath.row]];
    }else{
        cell.textLabel.text = moreNames[indexPath.row];
        cell.detailTextLabel.text = moreDetails[moreNames[indexPath.row]];
    }

    
    return cell;
}

//Gives out an alert message when any row is selected
/*
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"My Message" message:[NSString stringWithFormat:@"%d", indexPath.row] delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    
    [alert show];
}
*/


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"details";
    }else{
        return  @"more details";
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"version" withExtension:@"plist"];
    NSURL *url2 = [[NSBundle mainBundle] URLForResource:@"Defaults" withExtension:@"plist"];

    //load the plist into dictionsry
    details = [NSDictionary dictionaryWithContentsOfURL:url];
    moreDetails = [NSDictionary dictionaryWithContentsOfURL:url2];
    
    //create an array with just the keys
    justNames = details.allKeys;
    moreNames = moreDetails.allKeys;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
