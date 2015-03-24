# Background

演示如何使用后台位置更新使App在后台运行。

步骤:

1. 在plist中添加NSLocationAlwaysUsageDescription，给用户一个显示一个请求长期使用位置更新的原因，(8.0以上)
2. 在Capabilities中，打开“Location update”，来开启后台模式
3. 在代码中，调用`requestAlwaysAuthorization`，申请位置更新权限。(8.0以上)
4. 调用`startUpdatingLocation`开始跟踪更新。此时如果App进入到后台，系统会把此App保持运行一段时间，一段时间后（时长不定，测定十分钟以上），如果没有什么位置更新，更新会停止，如果位置发生了变化，会被重新唤醒，并再次更新。
5. 调用`stopUpdatingLocation`来停止跟踪更新。
6. 通过设定`distanceFilter`来控制update事件的频率。
7. 通过设定`pausesLocationUpdatesAutomatically`为`NO`来关闭`发现位置不再更新时停止调用`的功能。

策略：
1. 可以通过Monitor Region方法，在进入某一个区域时，开启位置监测，运行在后台一段时间后，如果离开此区域，则停止区域监测。



