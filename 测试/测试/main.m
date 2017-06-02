//
//  main.m
//  测试
//
//  Created by LiHongYu on 2017/3/8.
//  Copyright © 2017年 LiHongYu. All rights reserved.
//

#import <Foundation/Foundation.h>


//打印数组
void pout(int arr[] ,int a){
    for (int i = 0; i<a; i++) {
        printf("%i",arr[i]);
    }
}


/*
 稳定排序：插入，冒泡，选择。
 平均时间复杂度：O(n^2)
*/

//插入排序
void insertSort(int arr[],int a ){
     //取出值的前位比取出值大便向后移一位直到循环结束，此时j数值为取出值应在位前一位。
    for (int i = 1;i<a ;i++) {
        
        int v = arr[i];//取出值
        int j = i-1;
        
        while (j>=0 && v < arr[j]) {
            arr[j+1] = arr[j];
            j--;
        }
        
        arr[j+1] = v;
    }

    pout(arr,a);
}

//希尔排序
void hill(int arr[] ,int a){
    int d;
    
    for ( d =a/2; d>=1; d= d/2) {
        for (int i = d+1; i<=a ; i++) {
            int k = arr[i];
            int j;
            for (j = i-d; j>0&&k<arr[j]; j=j-d) {
                arr[j+d] = arr[j];
            }
            arr[j+d] = k;
            
            
        }
    }
}


//冒泡排序
void bubble(int arr[] , int a ){
    
    for (int i = 1; i<a; i++) {
        //j>=i+1是因为只进行未排序部分的比较
        for (int j = a - 1; j>=i; j--) {
            
            if (arr[j]<arr[j-1]) {
                int k = arr[j];
                arr[j] = arr[j-1];
                arr[j-1] = k;
            }
        }
    }
    pout(arr, a);
}


//选择排序
void selection(int arr[],int a){
    
    for (int i = 0; i<a-1; i++) {
        
        int min = i; //未排序部分数组最小值的位置
        
        for (int j=i; j<a; j++) {
            
            if (arr[j]<arr[min]) {
                min = j;
            }
        }
        
        int t = arr[i];
        arr[i] = arr[min];
        arr[min] = t;
    }

    pout(arr, a);
}


//归并排序
void merge(int A[],int left ,int mid ,int right){
    
    int L[100000],R[100000];
    int n1 = mid - left ;
    int n2 = right - mid;
    for ( int i = 0; i< n1; i++){
        L[i] = A[left + i];
    }
    for (int i = 0; i<n2; i++) {
        R[i] = A[mid + i];
    }
    
    int i = 0,j = 0;
    for (int k = left; k<right; k++) {
        if (L[i]>R[j]) {
            A[k] = L[i];
            i++;
        }else{
            A[k] = R[j];
            j++;
        }
    }
    
}

void mersort(int A[],int left ,int right){

    if (left+1 < right) {
        
        int mid = (left+right)/2;
        mersort(A, left, mid);
        mersort(A, mid, right);
        merge(A, left, mid, right);
    }
}




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int arr[]={9,5,3,2,4,4,6,9,2};
        int a = sizeof(arr)/sizeof(arr[0]);//数组占内存总空间除以单个元素占内存空间大小，即等于元素个数
        
     //   insertSort(arr,a);
      //  bubble(arr,a);
       // selection(arr,a);
        
        mersort(arr, 0, a);
        pout(arr, a);
    }
    return 0;
}

