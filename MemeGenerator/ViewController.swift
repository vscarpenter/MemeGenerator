//
//  ViewController.swift
//  MemeGenerator
//
//  Created by Vinny Carpenter on 12/29/14.
//  Copyright (c) 2014 Vinny Carpenter. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {

    @IBOutlet var topText: UITextField!
    @IBOutlet var bottomText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func aboutButtonClicked(sender: AnyObject) {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func selectImageButtonClicked(sender: AnyObject) {
        var imagePicker = UIImagePickerController()
        
        var sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        
        if (UIImagePickerController.isSourceTypeAvailable(sourceType)) {
            imagePicker.sourceType = sourceType
            imagePicker.delegate = self
            presentViewController(imagePicker, animated: true, completion: nil)
        }
    }

    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]){
        
        var image = info[UIImagePickerControllerOriginalImage] as UIImage
        let memeViewController = self.storyboard?.instantiateViewControllerWithIdentifier("memeVC") as MemeViewController
        memeViewController.image = image
        memeViewController.text1 = topText.text
        memeViewController.text2 = bottomText.text
        
        self.navigationController?.pushViewController(memeViewController, animated: true)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        println("Cancel")
        dismissViewControllerAnimated(true, completion: nil)
        
    }
}

