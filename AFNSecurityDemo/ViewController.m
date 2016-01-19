//
//  ViewController.m
//  AFNSecurityDemo
//
//  Created by JunyangWu on 1/19/16.
//  Copyright © 2016 NetEase Youdao. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self usingPublicKey];
    [self usingCertificates];
}

- (void)usingCertificates {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSSet *certificates = [AFSecurityPolicy certificatesInBundle:[NSBundle mainBundle]];
    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate withPinnedCertificates:certificates];
    manager.securityPolicy = policy;

    [manager GET:@"https://app.huihui.cn/app/abroad/top"
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             NSLog(@"AFSSLPinningModeCertificate succ");
         }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"AFSSLPinningModeCertificate error: %@",error);
         }];
}

- (void)usingPublicKey {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSSet *certificates = [AFSecurityPolicy certificatesInBundle:[NSBundle mainBundle]];
    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModePublicKey withPinnedCertificates:certificates];
    manager.securityPolicy = policy;

    [manager GET:@"https://app.huihui.cn/app/abroad/top"
      parameters:nil
        progress:nil
         success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             NSLog(@"AFSSLPinningModePublicKey succ");
         }
         failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             NSLog(@"AFSSLPinningModePublicKey error: %@",error);
         }];
}

@end
