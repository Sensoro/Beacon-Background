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
    var timer : Timer!;
    var timeCall = 0;
    
    @IBOutlet weak var actionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if #available(iOS 8.0, *) {
            locationManager.requestAlwaysAuthorization()
        } else {
            // Fallback on earlier versions
        };
        locationManager.delegate = self;
        //locationManager.pausesLocationUpdatesAutomatically = false; //打开此选项可以持续后台运行。关闭会导致一段时间后后台更新停止。
        
        timer = Timer.scheduledTimer(timeInterval: 5, target: self,
                                     selector: #selector(logout(timer:)), userInfo: nil, repeats: true);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func actionPress(sender: AnyObject) {
        if started == false{
            started = true;
            actionButton.setTitle("结束", for: .normal);
            
            locationManager.startUpdatingLocation();
        }else{
            started = false;
            actionButton.setTitle("开始", for: .normal);
            
            locationManager.stopUpdatingLocation();
        }
    }

    @objc func logout(timer : Timer) -> Void{
        NSLog("It is %d call!", timeCall);
        timeCall += 1;
    }
    
    //MARK: CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        NSLog("did Update Locations");
    }
}

