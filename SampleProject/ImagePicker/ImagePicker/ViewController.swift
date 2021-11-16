//
//  ViewController.swift
//  ImagePicker
//
//  Created by koji torishima on 2021/11/16.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var changeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func changeAction(_ sender: Any) {
        showImageActionPickerView()
    }
}

extension ViewController {
    private func showViews(sourceType: UIImagePickerController.SourceType) {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = self
        // デフォルト機能のトリミングならこれでOK
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
    }
    
    private func checkCameraPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            // 許可
            showViews(sourceType: .camera)
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { [weak self] granted in
                DispatchQueue.main.async {
                    if granted {
                        // 許可
                        self?.showViews(sourceType: .camera)
                    } else {
                        // not Impl
                    }
                }
            }
        case .denied:
            print("カメラが使用できない、設定アプリを開いてアクセス許可してね")
        case .restricted:
            print("カメラを使用できません")
        @unknown default:
            break
        }
    }
    
    private func showImageActionPickerView() {
        let alert = UIAlertController(title: nil,
                                      message: nil,
                                      preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "画像を選択", style: .default, handler: { [weak self] _ in
            self?.showViews(sourceType: .photoLibrary)
        }))
        alert.addAction(UIAlertAction(title: "カメラで撮影", style: .default, handler: { [weak self] _ in
            self?.checkCameraPermission()
        }))
        
        alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel))
        present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true, completion: nil)
        // トリミングしたものを反映する場合はeditedImageを使用する
        if let image = info[.editedImage] as? UIImage {
            // カメラの時は保存, それ以外は保存しない
            switch picker.sourceType {
            case .camera:
                print("何も保存しない")
                // UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
            default:
                break
            }
            
            imageView.image = image
        }
    }
}

extension ViewController: UINavigationControllerDelegate {}
