//
//  ToDoListTableViewController.m
//  ToDoList
//
//  Created by Benjas on 05/02/15.
//  Copyright (c) 2015 Benjas. All rights reserved.
//

#import "ToDoListTableViewController.h"
#import "AddToDoItem.h"
#import "ToDoItem.h"


@interface ToDoListTableViewController ()

@property NSMutableArray *toDoItems;

@end


@implementation ToDoListTableViewController

- (void)loadInitialData
{
    
    ToDoItem *item1 = [[ToDoItem alloc] init ];
    item1.itemName = @"Terminar";
    [self.toDoItems addObject:item1];
    
    ToDoItem *item2 = [[ToDoItem alloc] init ];
    item2.itemName = @"Avanzar";
    [self.toDoItems addObject:item2];
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    AddToDoItem *source = [segue sourceViewController];
    ToDoItem *item = source.toDoItem;
    if (item != nil){
        [self.toDoItems addObject:item];
        [self.tableView reloadData];
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.toDoItems = [[NSMutableArray alloc] init];
    [self loadInitialData];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [self.toDoItems count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListPrototypeCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    ToDoItem *toDoItem = [self.toDoItems objectAtIndex:indexPath.row];
    cell.textLabel.text = toDoItem.itemName;
    
    //coloca la marca de check activa o inactiva
    if (toDoItem.completed) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    //if (sender != self.saveButton) return;
    
}
*/

// agregar una marca a la celda
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath: indexPath animated:NO]; //deseleccionar la celda inmediatamente después de la selección.
    ToDoItem *tappedItem = [self.toDoItems objectAtIndex:indexPath.row]; //busca en el array el elemento que corresponda a la celda tocada.
    tappedItem.completed = !tappedItem.completed; //asigna el estado del elemento tocado.
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone]; //le indica al tableview que re cargue la celda marcada.
    
    
    
    
}


@end
