//
//  ViewController.swift
//  Web Service Example
//
//  Created by Dominika on 10.03.2015.
//  Copyright (c) 2015 DominikaBienkowska. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
       self.myNameLabel.text = ""
        
        //instantiate a gray Activity Indicator View
        var activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        //add the activity to the ViewController's view
        view.addSubview(activityIndicatorView)
        //position the Activity Indicator View in the center of the view
        activityIndicatorView.center = view.center
        //tell the Activity Indicator View to begin animating
        activityIndicatorView.startAnimating()

        
        
        let manager = AFHTTPRequestOperationManager()
        
        manager.GET( "http:/graph.facebook.com/stevejobs",
            parameters: nil,
            success: { (operation: AFHTTPRequestOperation!,responseObject: AnyObject!) in
                println("Response: " + responseObject.description)
                
                if let myName = responseObject["name"] as? String {
                    self.myNameLabel.text = myName
                }
            },
            failure: { (operation: AFHTTPRequestOperation!,error: NSError!) in
                println("Error: " + error.localizedDescription)
        })
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

