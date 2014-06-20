//
//  RPViewController.m
//  TableExample
//
//  Created by Rakshit Pithadia on 5/31/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import "RPCoursesViewController.h"

@interface RPCoursesViewController (){
    NSMutableArray *courses;
}

@end

@implementation RPCoursesViewController{
    NSDictionary *details;
    NSArray *justNames;
    
    NSDictionary *moreDetails;
    NSArray *moreNames;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return courses.count;
    }else{
        return moreDetails.count;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //create new cell
    //UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    //Using reusable cells... Very efficient if we have too many (100 or more) rows
    UITableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    RPCourse *currentCourse = [courses objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [currentCourse name];
    
    //To add cell icons
    //Retrieve an image
    
    //    UIImage *myImage = [UIImage imageNamed:@"DemoCellImage"];
    //    [cell.imageView setImage:myImage];
    
    //fill cell
    //    if (indexPath.section == 0) {
    //        cell.textLabel.text = justNames[indexPath.row];
    //        cell.detailTextLabel.text = details[justNames[indexPath.row]];
    //    }else{
    //        cell.textLabel.text = moreNames[indexPath.row];
    //        cell.detailTextLabel.text = moreDetails[moreNames[indexPath.row]];
    //    }
    
    
    //Configure the cell
    
    
    
    
    //    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    return cell;
}

//Gives out an alert message when any row is selected

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
    
    //    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"My Message" message:[NSString stringWithFormat:@"%d", indexPath.row] delegate:nil cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    //
    //    [alert show];
}



-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"500 Level Courses";
    }else{
        return  @"600 Level Courses";
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //    NSURL *url = [[NSBundle mainBundle] URLForResource:@"version" withExtension:@"plist"];
    //    NSURL *url2 = [[NSBundle mainBundle] URLForResource:@"Defaults" withExtension:@"plist"];
    //
    //    //load the plist into dictionsry
    //    details = [NSDictionary dictionaryWithContentsOfURL:url];
    //    moreDetails = [NSDictionary dictionaryWithContentsOfURL:url2];
    //
    //    //create an array with just the keys
    //    justNames = details.allKeys;
    //    moreNames = moreDetails.allKeys;
    
    
    //Create an array
    courses = [[NSMutableArray alloc]init];
    
    RPCourse *course = [[RPCourse alloc]init];
    
    course.name = @"Algorithms and their analysis";
    course.deptNo = @"CS560";
    course.units = @"3";
    [courses addObject:course];
    
    
    course = [[RPCourse alloc]init];
    course.name = @"Object oriented programming";
    course.deptNo = @"CS535";
    course.units = @"3";
    [courses addObject:course];
    
    
    course = [[RPCourse alloc]init];
    course.name = @"Spatial Databases";
    course.deptNo = @"CS615";
    course.units = @"3";
    [courses addObject:course];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
