//
//  ViewController.m
//  Transition
//
//  Created by TRY-MAC01 on 15/6/24.
//  Copyright (c) 2015年 ZH. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (instancetype)init
{
    self = [super init];
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [self initWithColor:[UIColor whiteColor]];
}

- (instancetype)initWithColor:(UIColor *)color;
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.color = color;
        float r,g,b;
        [[self color] getRed:&r green:&g blue:&b alpha:nil];
        NSString *title = [NSString stringWithFormat:@"%d %d %d", (int)r * 255, (int)g * 255, (int)b * 255];
        [[self tabBarItem] setTitle:title];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [self color];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"the viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if ([self.color isEqual:[UIColor redColor]]) {
        self.view.backgroundColor = [UIColor purpleColor];
    }
    NSLog(@"the viewDidAppear");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s", _cmd);
    [self.navigationController pushViewController:[[ViewController alloc] initWithColor:[UIColor orangeColor]]  animated:YES];
}

@end
