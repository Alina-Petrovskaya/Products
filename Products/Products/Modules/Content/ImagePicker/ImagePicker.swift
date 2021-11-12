//
//  ImagePicker.swift
//  Products
//
//  Created by Alina Petrovskaya on 30.10.2021.
//

import UIKit

// MARK: - ImagePickerDelegate
protocol ImagePickerDelegate: AnyObject {

    func didSelect(image: Data?)

}

// MARK: - ImagePicker
class ImagePicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: - Private properties
    private weak var delegate: ImagePickerDelegate?

    // MARK: - Public properties
    
    // MARK: - Life cycle
    
    // MARK: - Private methods
    
    // MARK: - Public methods
    func getImagePicker(for type: UIImagePickerController.SourceType,
                        delegate: ImagePickerDelegate) -> UIImagePickerController {
        self.delegate                  = delegate
        let pickerController           = UIImagePickerController()
        pickerController.delegate      = self
        pickerController.allowsEditing = true
        pickerController.mediaTypes    = ["public.image"]
        pickerController.sourceType    = type
        pickerController.modalPresentationStyle = .overFullScreen

        return pickerController
    }

    private func pickerController(_ controller: UIImagePickerController, didSelect image: UIImage?) {
        controller.dismiss(animated: true)
        let imageData = image?.pngData()
        self.delegate?.didSelect(image: imageData)
    }

    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        pickerController(picker, didSelect: image)
    }
}
