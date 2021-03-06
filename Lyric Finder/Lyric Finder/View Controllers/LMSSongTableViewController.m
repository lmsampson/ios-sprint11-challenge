//
//  LMSSongTableViewController.m
//  Lyric Finder
//
//  Created by Lisa Sampson on 3/1/19.
//  Copyright © 2019 Lisa M Sampson. All rights reserved.
//

#import "LMSSongTableViewController.h"
#import "LMSSongController.h"
#import "LMSSongDetailViewController.h"

@interface LMSSongTableViewController ()

@end

@implementation LMSSongTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _songController = [[LMSSongController alloc] init];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.songController.lyrics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SongCell" forIndexPath:indexPath];
    
    LMSSong *lyric = self.songController.lyrics[indexPath.row];
    
    cell.textLabel.text = lyric.trackName;
    cell.detailTextLabel.text = lyric.artist;
    
    return cell;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AddLyricSegue"]) {
        LMSSongDetailViewController *destinationVC = segue.destinationViewController;
        destinationVC.songController = self.songController;
        
    } else if ([segue.identifier isEqualToString:@"ViewLyricSegue"]) {
        
        LMSSongDetailViewController *destinationVC = segue.destinationViewController;
        NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
        
        LMSSong *song = self.songController.lyrics[indexPath.row];
        destinationVC.songController = self.songController;
        destinationVC.song = song;
    }
}

@end
