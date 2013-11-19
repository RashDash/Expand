      //
      //  ACTableView.h
      //  Expand
      //
      //  Copyright (c) 2013 Ashwani Kumar Choudhary. All rights reserved.

#import <UIKit/UIKit.h>

@interface ACTableView : UIViewController<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
{
      NSMutableArray *art1;
      NSArray *fiji ;
      IBOutlet UITableView *tab;
      BOOL expanded;
      NSMutableArray *nameListArray;
      NSMutableArray *tmpArray;
      NSMutableArray *ListOfItems;
      NSArray *temp;
      NSMutableArray *sections;
      NSIndexPath *indexP;
      BOOL searching;
      NSIndexPath *indexS ;
      NSMutableArray *art;
      BOOL letUserSelectRow;
      NSMutableArray *Mycopy_list;
      NSArray * sortArray;
      NSMutableArray * listOfName;
      BOOL firsttime,secondtime;
}
@end
