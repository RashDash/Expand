      //
      //  ACTableView.m
      //  Expand
      //
      //  Copyright (c) 2013 Ashwani Kumar Choudhary. All rights reserved.
      //

#import "ACTableView.h"

int d;
int artcnt;
int ttlSetcions;
int dcheck;

@interface ACTableView ()

@end

@implementation ACTableView
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
      self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
      if (self) {
            CGRect screenRect = [[UIScreen mainScreen] bounds];
            CGFloat screenHeight = screenRect.size.height;
            if (screenHeight == 480) {
                        //Retina - 3.5
                  self = [super initWithNibName:@"ACTableView4" bundle:nibBundleOrNil];
            }
            else {
                        //Retina - 4
                  self = [super initWithNibName:@"ACTableView" bundle:nibBundleOrNil];
            }
      }
      return self;
}


- (void)viewDidLoad {
      [super viewDidLoad];

            //Self View Title
      self.title = @"Expand the Cell";

            //Check for iOS 7
      if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)])
          {
            self.edgesForExtendedLayout = UIRectEdgeNone;
            self.automaticallyAdjustsScrollViewInsets = NO;
          }

            //Gradient layer set over the View
      CAGradientLayer *gradient = [CAGradientLayer layer];
      gradient.frame = self.view.bounds;
      gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor grayColor] CGColor], (id)[[UIColor whiteColor] CGColor], nil];
      [self.view.layer insertSublayer:gradient atIndex:0];

      [tab setBackgroundColor:[UIColor clearColor]];//Tabel background cleared


            //Array Memory Allocation
	art = [[NSMutableArray alloc]init];
      sections = [[NSMutableArray alloc]init];
      ListOfItems = [[NSMutableArray alloc] init];
      temp = [[NSArray alloc]init];
	nameListArray = [[NSMutableArray alloc]init];

	tab.tableFooterView = [[[UIView alloc] initWithFrame:CGRectZero]autorelease];//Table Show the cell which contains data only

	[tab setSeparatorColor:[UIColor colorWithRed:0.0f / 255.0f green:0.0f / 255.0f blue:0.0f / 255.0f alpha:0.9f]];//Table Cel seperator color changed



	NSArray *cleanedArray = nil;

            /***********************Add your data to be dislayed over the cells*******************/
	[nameListArray addObject:@"Anil"];
	[nameListArray addObject:@"Ajay"];
	[nameListArray addObject:@"Abneet"];
	[nameListArray addObject:@"Aankansha"];
	[nameListArray addObject:@"Sunja"];
	[nameListArray addObject:@"Sanjay"];
	[nameListArray addObject:@"Sanjoli"];
	[nameListArray addObject:@"Shaym"];
	[nameListArray addObject:@"Bhushan"];
	[nameListArray addObject:@"Balwan"];
	[nameListArray addObject:@"Babita"];
	[nameListArray addObject:@"Batra"];
	[nameListArray addObject:@"Ashwani"];
	[nameListArray addObject:@"Pinks"];
	[nameListArray addObject:@"Pankaj"];
	[nameListArray addObject:@"Payal"];
	[nameListArray addObject:@"Pyrinka"];
	[nameListArray addObject:@"Deepak"];
	[nameListArray addObject:@"Depali"];
	[nameListArray addObject:@"Depansu"];
	[nameListArray addObject:@"Diskha"];
	[nameListArray addObject:@"Deep"];
	[nameListArray addObject:@"Inder"];
	[nameListArray addObject:@"Ishita"];
	[nameListArray addObject:@"India"];
	[nameListArray addObject:@"ink"];
	[nameListArray addObject:@"Ashu"];
	[nameListArray addObject:@"puspender"];
	[nameListArray addObject:@"pawan"];
            /***********************************************************************************/

	/*-----captilaises the first char in string and replace array-----*/
	for (int y = 0; y < [nameListArray count]; y++) {
		NSString *letr = [nameListArray objectAtIndex:y];
		NSString *capitalisedSentence = [letr stringByReplacingCharactersInRange:NSMakeRange(0, 1)
		                                                              withString:[[letr substringToIndex:1] capitalizedString]];
		[nameListArray replaceObjectAtIndex:y withObject:capitalisedSentence];
	}

	for (int e = 0; e < [nameListArray count]; e++) {
		char alphabet = [[nameListArray objectAtIndex:e] characterAtIndex:0];
		NSString *uniChar = [NSString stringWithFormat:@"%c", alphabet];

		[sections addObject:uniChar];
		cleanedArray = [[NSSet setWithArray:sections] allObjects];
		[sections removeAllObjects];
		[sections addObjectsFromArray:cleanedArray];
		sortArray = [sections sortedArrayUsingSelector:@selector(compare:)];
	}
	NSLog(@"%@", sortArray);

	/*****filterate the array*******/
	for (int i = 0; i < [sortArray count]; i++) {
		char alphabet = [[sortArray objectAtIndex:i] characterAtIndex:0];
		NSString *uniChar = [NSString stringWithFormat:@"%c", alphabet];
		NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF beginswith[c] %@", uniChar];
		temp = [nameListArray filteredArrayUsingPredicate:predicate];
		int u = [temp count];
		NSLog(@"%i", u);
		[ListOfItems insertObject:temp atIndex:i];
	}


	NSLog(@"cleaned array%@", ListOfItems);
	NSLog(@"cleaned array%@", sections);
	sections = (NSMutableArray *)sortArray;


	firsttime = TRUE;

	sections = [[NSMutableArray alloc]initWithArray:sortArray];
	ttlSetcions = sections.count;


	fiji = [[NSArray alloc]initWithObjects:@"1", nil];
	art1 = [[NSMutableArray alloc]init];
	for (int k = 0; k < ttlSetcions; k++) {
		[art insertObject:fiji atIndex:k];
		[art1 addObject:@"NO"];
	}


}



- (void)buttonPressed:(UIButton *)sender {
	if ([[art1 objectAtIndex:sender.tag]isEqualToString:@"NO"]) {
		[art1 replaceObjectAtIndex:sender.tag withObject:@"YES"];
		expanded = TRUE;
	}
	else {
		[art1 replaceObjectAtIndex:sender.tag withObject:@"NO"];
		expanded = FALSE;
	}

	firsttime = FALSE;
	secondtime = TRUE;
	NSLog(@"%i", sender.tag);
	NSArray *fgt = [ListOfItems objectAtIndex:sender.tag];
	[art replaceObjectAtIndex:sender.tag withObject:fgt];
	NSLog(@"%@", art);
	NSLog(@"%@", sections);
	d = sender.tag;

	if (expanded) {
		NSMutableArray *indexPathsInsert = [[[NSMutableArray alloc] init] autorelease];
		NSArray *fge = [art objectAtIndex:sender.tag];
		for (int i = 0; i < [fge count]; i++)
			[indexPathsInsert addObject:[NSIndexPath indexPathForRow:i inSection:d]];
		[tab insertRowsAtIndexPaths:indexPathsInsert withRowAnimation:UITableViewRowAnimationTop];
	}
	else {
		NSMutableArray *indexPathsDelete = [[[NSMutableArray alloc] init] autorelease];
		NSArray *fge = [art objectAtIndex:sender.tag];
		for (int i = 0; i < [fge count]; i++)
			[indexPathsDelete addObject:[NSIndexPath indexPathForRow:i inSection:d]];
		[art insertObject:fiji atIndex:sender.tag];
		[art removeObjectAtIndex:sender.tag + 1];
		[tab deleteRowsAtIndexPaths:indexPathsDelete withRowAnimation:UITableViewRowAnimationTop];
	}
	[tab endUpdates];
}


#pragma mark - TabeView Datasource & Delegates
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (firsttime) {
		return 0;
	}
	if (secondtime) {
		int b;
		NSArray *rty = [art objectAtIndex:section];


		if ([[rty objectAtIndex:0] isEqualToString:@"1"]) {
			b = 0;
		}

		else {
			b = rty.count;
		}
		return b;
	}

	return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *simpleTableIdentifier = @"SimpleTableItem";

	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];

	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
	}
	NSMutableArray *fgtr = [art objectAtIndex:indexPath.section];

      cell.textLabel.font=[UIFont fontWithName:@"Avenir-Book" size:15];
	cell.textLabel.textColor = [UIColor blackColor];
	cell.textLabel.text = [fgtr objectAtIndex:indexPath.row];
	return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return ttlSetcions;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	NSLog(@"Rashdash");
}

/***********************Header to be expanded*******************************/
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
	UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 48)];
	UIButton *headerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	headerBtn.frame = CGRectMake(1.0, 1, 319.0, 47.0);
	[headerBtn addTarget:self
                    action:@selector(buttonPressed:)
          forControlEvents:UIControlEventTouchDown];
	headerBtn.tag = section;
	UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(5, 15, 100, 20)];
	[lb setBackgroundColor:[UIColor clearColor]];

      lb.font=[UIFont fontWithName:@"Avenir-Book" size:15];
	lb.text = [sections objectAtIndex:section];
	lb.textColor = [UIColor whiteColor];
	[headerBtn addSubview:lb];
	[headerView addSubview:headerBtn];
	headerView.layer.borderWidth = 1;
	headerView.layer.borderColor = [[UIColor grayColor] CGColor];
	[headerView setBackgroundColor:[UIColor colorWithRed:0.0f / 255.0f green:0.0f / 255.0f blue:0.0f / 255.0f alpha:0.9f]];

	return headerView;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
            // Dispose of any resources that can be recreated.
}
@end
