//
//  Config.h
//  Poem
//
//  Created by wuhuping on 14-6-23.
//  Copyright (c) 2014年 wuhuping. All rights reserved.
//

#ifndef Poem_Config_h
#define Poem_Config_h

//#define CoreData @"CoreData"

//服务器地址
#define kSerVerDomain @"http://112.124.6.237"

//当前系统版本
#define kVersion ([[[UIDevice currentDevice] systemVersion] floatValue])

//设备是否是ipad
#define IsPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

//屏幕尺寸
#define kWinSize ((kVersion >= 7.0) ? ([UIScreen mainScreen].bounds.size) : ([UIScreen mainScreen].applicationFrame.size))

#endif
