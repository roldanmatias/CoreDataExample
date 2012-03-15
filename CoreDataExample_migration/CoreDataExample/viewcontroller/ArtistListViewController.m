//
//  ArtistListViewController.m
//  CoreDataExample
//
//  Created by Matias Roldan on 2/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ArtistListViewController.h"
#import "CDEAppDelegate.h"
#import "ArtistEditViewController.h"
#import "Artist.h"
#import "ArtistInfoViewController.h"
#import "Label.h"

@interface ArtistListViewController (private)

-(void) addArtist;
-(void) configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;

@end

@implementation ArtistListViewController

@synthesize fetchedResultsController = _fetchedResultsController;
@synthesize managedObjectContext = _managedObjectContext;
@synthesize addingManagedObjectContext = _addingManagedObjectContext;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"Artists";
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    // Configure the add button.
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] 
                                  initWithBarButtonSystemItem:UIBarButtonSystemItemAdd 
                                  target:self 
                                  action:@selector(addArtist)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    
    
    CDEAppDelegate *appDelegate = (CDEAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    self.managedObjectContext = [appDelegate managedObjectContext];
    
    NSError *error;
	if (![[self fetchedResultsController] performFetch:&error]) {
		NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
		exit(-1);
	}

}

- (void)viewDidUnload
{
    self.fetchedResultsController = nil;
    self.managedObjectContext = nil;
    self.addingManagedObjectContext = nil;
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return [[_fetchedResultsController sections] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    id <NSFetchedResultsSectionInfo> sectionInfo = [[_fetchedResultsController sections] objectAtIndex:section];
	return [sectionInfo numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }//UITableViewCellStyleDefault
        
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
		
		// Delete the managed object.
		NSManagedObjectContext *context = [_fetchedResultsController managedObjectContext];
		[context deleteObject:[_fetchedResultsController objectAtIndexPath:indexPath]];
		
		NSError *error;
		if (![context save:&error]) {
			// Update to handle the error appropriately.
			NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
			exit(-1);
		}
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	ArtistInfoViewController *detailViewController = [[ArtistInfoViewController alloc] initWithNibName:@"ArtistInfoViewController" bundle:nil];
    
    Artist *artist = [_fetchedResultsController objectAtIndexPath:indexPath];
    detailViewController.artist = artist;
    detailViewController.delegate = self;

	[self.navigationController pushViewController:detailViewController animated:YES];
}

#pragma mark - private methods

-(void) addArtist {
    
    // Create a new managed object context for the new book -- set its persistent store coordinator to the same as that from the fetched results controller's context.
	NSManagedObjectContext *addingContext = [[NSManagedObjectContext alloc] init];
	self.addingManagedObjectContext = addingContext;
	
	[_addingManagedObjectContext setPersistentStoreCoordinator:[[_fetchedResultsController managedObjectContext] persistentStoreCoordinator]];
    
	Artist *artist = (Artist *)[NSEntityDescription insertNewObjectForEntityForName:@"Artist" inManagedObjectContext:addingContext];
	
    ArtistEditViewController *detail = [[ArtistEditViewController alloc] init];
    detail.delegate = self;
    detail.artist = artist;
    [self.navigationController pushViewController:detail animated:YES];
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {

	Artist *artist = [_fetchedResultsController objectAtIndexPath:indexPath];
	cell.textLabel.text = artist.name;
    cell.imageView.image = [UIImage imageWithData: artist.imgData];

    NSMutableArray *labelsArray = (NSMutableArray *) artist.labels;
    Label *lbl1 = (Label *) [labelsArray objectAtIndex:0];
    Label *lbl2 = (Label *) [labelsArray objectAtIndex:1];
    NSString *aLabelsDetail = [[NSString alloc] initWithFormat:@"%@, %@", lbl1.name, lbl2.name];
    cell.detailTextLabel.text = aLabelsDetail;
}

#pragma mark - delegate methods

-(void) saveArtist {
    
    if (_addingManagedObjectContext == nil) {
        
        NSManagedObjectContext *addingContext = [[NSManagedObjectContext alloc] init];
        self.addingManagedObjectContext = addingContext;
        
        [_addingManagedObjectContext setPersistentStoreCoordinator:[[_fetchedResultsController managedObjectContext] persistentStoreCoordinator]];
        
    }
    
    NSNotificationCenter *dnc = [NSNotificationCenter defaultCenter];
    [dnc addObserver:self selector:@selector(addControllerContextDidSave:) name:NSManagedObjectContextDidSaveNotification object:_addingManagedObjectContext];
    
    NSError *error;
    if (![_addingManagedObjectContext save:&error]) {
        // Update to handle the error appropriately.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        exit(-1);
    }
    [dnc removeObserver:self name:NSManagedObjectContextDidSaveNotification object:_addingManagedObjectContext];
    
    // Release the adding managed object context.
    self.addingManagedObjectContext = nil;    

}

-(void) cancelArtist {
    
}


- (NSFetchedResultsController *)fetchedResultsController {
    
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
	// Create and configure a fetch request with the Book entity.
	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Artist" inManagedObjectContext:_managedObjectContext];
	[fetchRequest setEntity:entity];
	
	// Create the sort descriptors array.
	NSSortDescriptor *artistName = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    
	NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:artistName, nil];
	[fetchRequest setSortDescriptors:sortDescriptors];
    
	// Create and initialize the fetch results controller.
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:_managedObjectContext sectionNameKeyPath:@"name" cacheName:@"Root"];
    
	self.fetchedResultsController = aFetchedResultsController;
	_fetchedResultsController.delegate = self;
	
	return _fetchedResultsController;
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
	// The fetch controller is about to start sending change notifications, so prepare the table view for updates.
	[self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
	
	UITableView *tableView = self.tableView;
    
	switch(type) {
			
		case NSFetchedResultsChangeInsert:
			[tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
			break;
			
		case NSFetchedResultsChangeDelete:
			[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
			break;
			
		case NSFetchedResultsChangeUpdate:
			[self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
			break;
			
		case NSFetchedResultsChangeMove:
			[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
			break;
	}
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type {
	
	switch(type) {
			
		case NSFetchedResultsChangeInsert:
			[self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
			break;
			
		case NSFetchedResultsChangeDelete:
			[self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
			break;
	}
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
	// The fetch controller has sent all current change notifications, so tell the table view to process all updates.
	[self.tableView endUpdates];
}

- (void)addControllerContextDidSave:(NSNotification*)saveNotification {
	
	NSManagedObjectContext *context = [_fetchedResultsController managedObjectContext];
	// Merging chang¡es causes the fetched results controller to update its results
	[context mergeChangesFromContextDidSaveNotification:saveNotification];	
}

@end
