//
//  ViewController.swift
//  NSExceptionsDomain
//
//  Created by Chakkapan Rapeepunpienpen on 6/27/16.
//  Copyright © 2016 free.as.a.birdbyrd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sendHttpGetToApple(sender: AnyObject) {
        performHttpGetWithUrl("http://apple")
    }
    
    @IBAction func sendHttpGetToBirdByrd(sender: AnyObject) {
        performHttpGetWithUrl("http://birdbyrd.com")
    }
    
    func performHttpGetWithUrl(url:String) {
        let url = NSURL(string: url)
        let request = NSURLRequest(URL:url!)
        print("url: \(url!)")
        NSURLSession.sharedSession().dataTaskWithRequest(request) { data, response, error in
            guard error == nil && data != nil else {
                print("error=\(error)")
                return
            }
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
        }.resume()
    }
}

