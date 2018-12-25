//
//  PhotoManager.swift
//  iosManagers
//
//  Created by Ajay Merchia on 12/20/18.
//

import Foundation
import UIKit

class PhotoManager: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private var vc: UIViewController!
    private var button: UIButton!
    private var imageview: UIImageView!
    private var buttonType: Bool!
    
//    static let darkPlaceholder: UIImage("")
    
    init(vc: UIViewController, button: UIButton) {
        buttonType = true
        self.button = button
        
        let bundle = Bundle(for: .self)
        let bundleURL = bundle.resourceURL?.URLByAppendingPathComponent("[YOUR_BUNDLE_NAME].bundle")
        let resourceBundle = NSBundle(URL: bundleURL!)
        UIImage(named: [IMAGE_NAME_STRING], in: resourceBundle, compatibleWith: nil)
        
    }
    
    enum PickerStyle {
        case light
        case dark
    }
    
    
    static func formatButtonForPicking(button: UIButton, style: PickerStyle) {
        
        button.imageView?.contentMode = .scaleAspectFill
        button.imageView?.layer.cornerRadius = 0.5 * profileSelectButton.frame.width
        button.imageView?.layer.borderWidth = 0.75
        
        let label_width: CGFloat = 150
        let label_height: CGFloat = 30
        
        let editPrompt = UILabel(frame: CGRect(x: (button.frame.width - label_width)/2, y: button.frame.height - label_height, width: label_width, height: label_height))
        editPrompt.text = "edit"
        editPrompt.textAlignment = .center
        editPrompt.textColor = UIColor.white
        
        switch style {
        case .light:
            button.imageView?.layer.borderColor = rgba(162,162,162,1).cgColor
            editPrompt.backgroundColor = UIColor.white.withAlphaComponent(0.8)
            editPrompt.textColor = UIColor.black
        case .dark:
            button.imageView?.layer.borderColor = rgba(240,240,240,1).cgColor
            editPrompt.backgroundColor = UIColor.black.withAlphaComponent(0.8)
            editPrompt.textColor = UIColor.white
        }
        
        button.addTarget(self, action: #selector(pickPhoto), for: .touchUpInside)
        button.imageView?.addSubview(editPrompt)
    }
    
    @objc func pickPhoto() {
        let actionSheet = UIAlertController(title: "Select Photo From", message: nil, preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action) -> Void in
            self.createImagePicker(preferredType: .camera)
        }))
        actionSheet.addAction(UIAlertAction(title: "Photo Gallery", style: .default, handler: { (action) -> Void in
            self.createImagePicker(preferredType: .photoLibrary)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        vc.present(actionSheet, animated: true)
    }

    
    func createImagePicker(preferredType: UIImagePickerController.SourceType) {
        
        let picker = UIImagePickerController()
        picker.delegate = self
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera)) {
            vc.sourceType = preferredType
            vc.allowsEditing = true
            vc.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            vc.present(picker, animated: true, completion: nil)
        }
        else {
            picker.sourceType = .photoLibrary
            vc.present(picker, animated: true, completion: nil)
            
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        
        let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
            
        if buttonType {
            button.setImage(chosenImage, for: .normal)
        } else {
            imageview.image = chosenImage
        }
        
        vc.dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        vc.dismiss(animated: true, completion: nil)
    }
    
    
}
