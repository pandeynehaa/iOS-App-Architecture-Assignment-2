//
//  secondViewController.swift
//  iOS AppArchitectureAssignment2
//
//  Created by macmini20 on 15/09/2022.
//Neha pandey

import UIKit
protocol SideSelectionDelegate: NSObject {
    func didTapChoice(image: UIImage)
}

class secondViewController: UIViewController {
//MARK: variables
    weak var changeImage: SideSelectionDelegate!
    var closuerss: ((UIImage)-> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
//MARK: Protocol
    @IBAction func protocolButton(_ sender: UIButton) {
        changeImage?.didTapChoice(image: UIImage(imageLiteralResourceName: "inosuke"))
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: Notification
    @IBAction func notificationButton(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "NOTIFICATION_FIRE"),object:UIImage.kimi)
        navigationController?.popViewController(animated: true)

    }
//   MARK: Closure
    @IBAction func closureButton(_ sender: Any) {
        guard let closuerss = closuerss else{
            return
        }
        closuerss(.anya)
        navigationController?.popViewController(animated: true)

    }
}

//MARK: Extensionss
extension UIImage{
    static let image = UIImage(named: "inosuke")!
    static let nosuke = UIImage(named: "nosuke")!
    static let anya = UIImage(named: "anya")!
    static let kimi = UIImage(named: "kimii")!
}
