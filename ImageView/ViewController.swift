//
//  ViewController.swift
//  ImageView
//
//  Created by 박소현 on 2020/04/19.
//  Copyright © 2020 Sohyun Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isZoom = false
    var imgOn: UIImage?
    var imgOff: UIImage?

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        imgView.image = imgOn

    }


    @IBAction func btnResizeImage(_ sender: UIButton) {
        let scale:CGFloat=1.5
        var newWidth:CGFloat, newHeight:CGFloat
        
        if(isZoom) //This is when the picture is zoomed, we minimize the picture
        {
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            btnResize.setTitle("Magnify",for: .normal)
        }
        else  //This is when the picture is minimized, we magnify the picture
        {
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            btnResize.setTitle("Minimize",for: .normal)
        }
        
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        //imgView.frame.origin.x =
        isZoom = !isZoom
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn
        {
            imgView.image = imgOn
        }
        else
        {
            imgView.image = imgOff
        }
    }
}

