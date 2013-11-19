      //
      //  ACTableView.h
      //  Expand
      //
      //  Copyright (c) 2013 Ashwani Kumar Choudhary. All rights reserved.

#import <UIKit/UIKit.h>

@interface ACTableView : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
{
      NSMutableArray *isExpanded;
      IBOutlet UITableView *tab;//TableView Outlet
      BOOL expanded;//Boolean to Check Expansion
      NSMutableArray *tmpArray;
      NSMutableArray *ListOfItems;
      NSMutableArray *sections;
      NSMutableArray *ExpandCellArray;
      BOOL letUserSelectRow;
      NSMutableArray * listOfName;
      BOOL firsttime,secondtime;//Boolean to Check first time load and then next ones of TableView
}
@end
