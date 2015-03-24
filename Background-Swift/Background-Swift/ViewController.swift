//
//  ViewController.swift
//  Background-Swift
//
//  Created by David Yang on 15/3/24.
//  Copyright (c) 2015年 Sensoro. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate{

    let locationManager = CLLocationManager();
    var started = false;
    var timer : NSTimer!;
    var timeCall = 0;
    
    @IBOutlet weak var actionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.requestAlwaysAuthorization();
        locationManager.delegate = self;
        //locationManager.pausesLocationUpdatesAutomatically = false; //打开此选项可以持续后台运行。关闭会导致一段时间后后台更新停止。
        
        timer = NSTimer.scheduledTimerWithTimeInterval(5, target: self,
            selector: "logout:", userInfo: nil, repeats: true);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actionPress(sender: AnyObject) {
        
        if started == false{
            started = true;
            actionButton.setTitle("结束", forState: .Normal);
            
            locationManager.startUpdatingLocation();
        }else{
            started = false;
            actionButton.setTitle("开始", forState: .Normal);
            
            locationManager.stopUpdatingLocation();
        }
    }

    func logout(timer : NSTimer) -> Void{
        NSLog("It is %d call!", timeCall++);
    }
    
    //MARK: CLLocationManagerDelegate
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        NSLog("did Update Locations");
    }
}

