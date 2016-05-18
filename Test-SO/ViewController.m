//
//  ViewController.m
//  Test-SO
//
//  Created by Sandeep Bhandari on 5/18/16.
//  Copyright © 2016 Sandeep Bhandari. All rights reserved.
//

#import "ViewController.h"
#import "TestScrollView.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UIGestureRecognizerDelegate> {
    NSArray *searches;
}
@property (strong, nonatomic) IBOutlet TestScrollView *testScrollView;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    searches = @[@"Sandeep",@"Gopal",@"Bhandari"];
    
    self.testScrollView.collectionViewBehind = self.collectionView;
    self.testScrollView.scrollViewBehind = self.scrollView;
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"test"];
    
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.delegate = self;
    [self.collectionView addGestureRecognizer:tapGesture];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return searches.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"test" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:100.0/255 green:100.0/255 blue:1.0 alpha:1];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Hi indexPath tapped is %@",indexPath);
}

-(void)handleTap:(UIGestureRecognizer *)recognizer {
    [self collectionView:self.collectionView didSelectItemAtIndexPath:[self.collectionView indexPathForItemAtPoint:[recognizer locationInView:self.collectionView]]];
}
@end
