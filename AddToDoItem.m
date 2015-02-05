//
//  AddToDoItem.m
//  ToDoList
//
//  Created by Benjas on 04/02/15.
//  Copyright (c) 2015 Benjas. All rights reserved.
//

#import "AddToDoItem.h"

@interface AddToDoItem ()
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *SaveButton;

@end

@implementation AddToDoItem

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if (sender != self.SaveButton) return;
    if (self.textField.text.length > 0) {
        self.toDoItem=[[ToDoItem alloc]init];
        self.toDoItem.itemName = self.textField.text;
        self.toDoItem.completed = NO;
    }
    
    
}


@end
