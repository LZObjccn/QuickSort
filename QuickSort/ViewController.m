//
//  ViewController.m
//  QuickSort
//
//  Created by lizizhen on 2019/8/25.
//  Copyright © 2019 lizi' zhen. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int a[6] = {2, 1, 0, 5, 4, 3};
    
    QuickSort(a, 0, 5); // 第二个参数表示第一个元素的下标，第三个参数代表最后一个元素的下标
    for (int i = 0; i<6; i++)
        printf("%d ", a[i]);
    printf("\n");
}

void QuickSort(int *a, int low, int high) {
    int pos;
    if (low < high) {
        pos = FindPos(a, low, high);
        QuickSort(a, low, pos-1);
        QuickSort(a, pos+1, high);
    }
}

int FindPos(int *a, int low, int high) {
    int val = a[low];
    
    while (low < high) {
        while (low<high && a[high]>=val)
            --high;
        a[low] = a[high];
        
        while (low<high && a[low]<=val)
            ++low;
        a[high] = a[low];
    } // 终止while循环以后low和high一定是相等的
    
    a[low] = val;
    return low; // low可以改为high，但是不能改为val, 或者是a[low], 或a[high]
}


@end

