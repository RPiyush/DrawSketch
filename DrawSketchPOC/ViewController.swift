//
//  ViewController.swift
//  DrawSketchPOC
//
//  Created by Piyush Rathi on 27/01/17.
//  Copyright © 2017 Kahuna Systems. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DrawSketchViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onSketchViewButtonClicked(_ sender: Any) {
        
        let drawsketchVC = DrawSketchViewController(nibName: "DrawSketchViewController", bundle: nil)
        drawsketchVC.previosAnnotationImagePath = ""
        drawsketchVC.isNewSnap = true
        let imagePath = Bundle.main.path(forResource: "drawViewBG", ofType: "png", inDirectory: "")
        let snapShotImage = UIImage(contentsOfFile: imagePath!)
        var imageName = self.pathForSavedImage(snapShotImage!)
        imageName = imageName.replacingOccurrences(of: "Photo", with: "SKETCH") as NSString
        print("take SnapShot")
        drawsketchVC.originalImage = snapShotImage;
        let snapImageTitle = imageName
        drawsketchVC.image_title = snapImageTitle as String
        self.present(drawsketchVC, animated: true, completion: {
        })
    }
    
    func pathForSavedImage(_ image:UIImage) -> NSString
    {
        var imageName:NSString = ""
        let isCreateNewPath = true
        
        if isCreateNewPath == true
        {
            let date = Date()
            imageName =  NSString(format: "Photo_%d.png", date as CVarArg)
        }
        
        let _ = self.saveImageInDocumentDirectory(image, with: imageName as String)
        
        return imageName
    }
    
    //MARK: - SAVE IMAGE TO DOCUMENT DIRECTORY
    func saveImageInDocumentDirectory(_ image:UIImage?, with imageName:String) -> Bool{
        
        var isFileWriteSuccess = false
        if image != nil{
            
            if let data = UIImagePNGRepresentation(image!)
            {
                let pathLocal = self.GetDocumentDirectoryFilePath()
                let filename = pathLocal.appendingFormat("/%@", imageName)
                
                isFileWriteSuccess = (try? data.write(to: URL(fileURLWithPath: filename as String), options: [.atomic])) != nil
            }
        }
        
        return isFileWriteSuccess
    }
    
    func GetDocumentDirectoryFilePath() ->String
    {
        let folderPath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as NSString
        
        return (folderPath as String)
    }

}

