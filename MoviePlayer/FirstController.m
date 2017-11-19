//
//  FirstController.m
//  MoviePlayer
//
//  Created by mac on 2017/11/15.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "FirstController.h"

#import <MediaPlayer/MPMoviePlayerController.h>
#import <AVFoundation/AVFoundation.h>

@interface FirstController ()

@property(nonatomic,strong) MPMoviePlayerController * hlsMoviePlayer;

@property(nonatomic,strong) UIView *blackView;

@property(nonatomic,copy) NSString *urlString;

@end

@implementation FirstController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor =[UIColor whiteColor];
    
    [self.view addSubview:self.blackView];
    
    //初始化播放器
    self.hlsMoviePlayer = [[MPMoviePlayerController alloc]init];
    self.hlsMoviePlayer.controlStyle = MPMovieControlStyleDefault;
    self.hlsMoviePlayer.view.backgroundColor = [UIColor blackColor];
    self.hlsMoviePlayer.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.blackView.frame.size.height);
    
    [self.view addSubview:self.hlsMoviePlayer.view];
    
    
    //播放器
    NSString *urlString = @"https://t-alioss01.e.vhall.cn/vhallcoop/demand/d376574c694fbf87a2c16879f3bab202/826432202/d376574c694fbf87a2c16879f3bab202.mp4?token=6BB43081_NzkxMzU0MjUzXzVBMTU0QzU3XzgyNjQzMjIwMl8xMDQyNjk2X3ZvZA";
    [self playInitWithUrlString:urlString];
    
    
//    self.hlsMoviePlayer.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.blackView.frame.size.height);//self.view.bounds;
//    [self.blackView addSubview:self.hlsMoviePlayer.view];
//    [self.blackView sendSubviewToBack:self.hlsMoviePlayer.view];
    
    UIButton *changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    changeBtn.frame = CGRectMake(self.view.center.x-50, self.view.bounds.size.height-200, 100, 100);
    [changeBtn setTitle:@"切换链接" forState:UIControlStateNormal];
    [changeBtn addTarget:self action:@selector(changeline) forControlEvents:UIControlEventTouchUpInside];
    changeBtn.backgroundColor = [UIColor blueColor];
    [self.view addSubview:changeBtn];
    
    
}

-(void)playInitWithUrlString:(NSString *)urlString
{
    
    NSURL *url =[NSURL URLWithString:urlString];
    
    self.hlsMoviePlayer.contentURL = url;
    
    [self.hlsMoviePlayer prepareToPlay];
    [self.hlsMoviePlayer play];
    
}



-(UIView *)blackView
{
    if (_blackView == nil) {
        
        _blackView = [[UIView alloc]init];
        _blackView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 300);
        _blackView.backgroundColor = [UIColor blackColor];
    }
    return _blackView;
}

-(void)changeline
{
    
     self.urlString = @"https://t-alioss01.e.vhall.cn/vhallcoop/demand/d376574c694fbf87a2c16879f3bab202/826432202/d376574c694fbf87a2c16879f3bab202.mp4?token=6BB43081_NzkxMzU0MjUzXzVBMTU0QzU3XzgyNjQzMjIwMl8xMDQyNjk2X3ZvZA";

    [self playInitWithUrlString:self.urlString];
    
}


/**
 *  添加视频播放的通知
 */
-(void)addNOfi
{
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(playbackstateDidChange:) name:MPMoviePlayerScalingModeDidChangeNotification object:nil];//播放状态改变，可配合playbakcState属性获取具体状态
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(playDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];//媒体播放完成或用户手动退出，具体完成原因可以通过通知userInfo中的key为MPMoviePlayerPlaybackDidFinishReasonUserInfoKey的对象获取
    
}

- (void)playDidFinish:(NSNotification *)noti
{
    //播放完成
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
