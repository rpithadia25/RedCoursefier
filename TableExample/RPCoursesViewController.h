//
//  RPViewController.h
//  TableExample
//
//  Created by Rakshit Pithadia on 5/31/14.
//  Copyright (c) 2014 Rakshit Pithadia. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RPCourse.h"

@interface RPCoursesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    NSMutableArray *arrayCheckUncheck; //Will handle which button is selected or which is unselected
    NSMutableArray *cellDataArray; // Data array
}

@end
