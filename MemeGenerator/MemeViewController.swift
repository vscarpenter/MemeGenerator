//
//  MemeViewController.swift
//  MemeGenerator
//
//  Created by Vinny Carpenter on 12/29/14.
//  Copyright (c) 2014 Vinny Carpenter. All rights reserved.
//

import UIKit

class MemeViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var bottomTextLabel: UILabel!
    @IBOutlet var topTextLabel: UILabel!
    var image: UIImage!
    var text1: String!
    var text2: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (image != nil) {
            imageView.image = image
            topTextLabel.text = text1
            topTextLabel.textColor = UIColor.whiteColor()
            topTextLabel.sizeToFit()
            imageView.addSubview(topTextLabel)
            
            
            bottomTextLabel.text = text2
            bottomTextLabel.textColor = UIColor.whiteColor()
            bottomTextLabel.sizeToFit()
            imageView.addSubview(bottomTextLabel)
            
        } else {
            println("image was null")
        }
    }
    
    
    @IBAction func saveButton(sender: AnyObject) {
        println("screenshot pressed")
        var image = takeScreenshot(imageView)
        UIImageWriteToSavedPhotosAlbum(image, self, Selector("image:didFinishSavingWithError:contextInfo:"), nil)
    }
    
    func image(image: UIImage, didFinishSavingWithError error: NSErrorPointer, contextInfo: UnsafePointer<()>) {
        dispatch_async(dispatch_get_main_queue(), {
            UIAlertView(title: "Success", message: "The meme has been saved to your Camera Roll", delegate: nil, cancelButtonTitle: "Close").show()
        })
    }
    
    func takeScreenshot(theView: UIView) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0.0)
        theView.drawViewHierarchyInRect(theView.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
}
