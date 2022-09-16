//
//  ViewController.swift
//  iOS AppArchitectureAssignment2
//
//  Created by macmini20 on 15/09/2022.
//Neha Pandey

import UIKit

class ViewController: UIViewController {
    
    //MARK: deinit
    deinit {
          NotificationCenter.default.removeObserver(self)
      }

//MARK: outlets
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var chooseButton: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        notify()
    }
//MARK:  notification button
    func notify(){
        NotificationCenter.default.addObserver(self, selector: #selector(changeBackround(notification:)), name: .init(rawValue: "NOTIFICATION_FIRE"), object:nil)
    }
    @objc func changeBackround(notification: NSNotification){
        if let image = notification.object as? UIImage{
            mainImageView.image = image
        }
    }
    
//MARK: choose button
    @IBAction func chooseButtonTapped(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "secondViewController") as! secondViewController
        controller.changeImage = self
        
        controller.closuerss = { [weak self] image in self?.mainImageView.image=image
            
        }
        navigationController?.pushViewController(controller, animated: true)
    }
}
//MARK: Extension
extension ViewController: SideSelectionDelegate {
    func didTapChoice(image: UIImage) {
        mainImageView.image = image
    }
}
