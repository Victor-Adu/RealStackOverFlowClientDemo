//
//  ViewController.swift
//  RealStackOverFlowClient
//
//  Created by Victor  Adu on 7/28/14.
//  Copyright (c) 2014 Victor  Adu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var viewIamge: UIImageView!
    
    @IBAction func downloadButton(sender: AnyObject) {
        
        //setup url
        var url = NSURL(string: "http://losthatsportsblog.com/wp-content/uploads/2013/06/lebron-james.jpg")
        
        var prepareQueue = NSOperationQueue() //Prepares and setup our 'url' object to be executed
        prepareQueue.maxConcurrentOperationCount = 1 //“The 'concurrent' here executes threads one at a time and adds more as needed to create additional execution paths.” Here we can set the 'concurrentOperationCount' to zero (default) or comment out since we are only dealing with one thing.
        
        prepareQueue.addOperationWithBlock( {() -> Void in
            
            var myData = NSData(contentsOfURL: url)  //fetch data from URL
            
            NSOperationQueue.mainQueue().addOperationWithBlock( {() -> Void in
            
                var someImage = UIImage(data: myData)
                self.viewIamge.image = someImage  //pass our fetched image (someImage) into viewIamge
            })
        })
    }
        
  /*
        //  Variation to above
        
        var imageOperation = NSOperation()
        var blockOperation = NSBlockOperation({() -> Void in
            
            //do something
            
            })
        prepareQueue.addOperation(blockOperation)   // end  should this be image operation
    }
*/
    
     override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


