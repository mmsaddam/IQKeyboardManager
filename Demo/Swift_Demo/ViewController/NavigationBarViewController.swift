//
//  NavigationBarViewController.swift
//  IQKeyboard
//
//  Created by Iftekhar on 23/09/14.
//  Copyright (c) 2014 Iftekhar. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class NavigationBarViewController: UIViewController, UITextFieldDelegate, UIPopoverPresentationControllerDelegate {

    fileprivate var returnKeyHandler: IQKeyboardReturnKeyHandler!
    @IBOutlet var textField2: UITextField!
    @IBOutlet var textField3: UITextField!
    @IBOutlet var scrollView: UIScrollView!

    deinit {
        returnKeyHandler = nil
        textField2 = nil
        textField3 = nil
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        textField3.iq.placeholder = "This is the customised placeholder title for displaying as toolbar title"

        returnKeyHandler = IQKeyboardReturnKeyHandler(controller: self)
        returnKeyHandler.lastTextFieldReturnKeyType = UIReturnKeyType.done
    }

    @IBAction func textFieldClicked(_ sender: UITextField!) {

    }

    @IBAction func enableScrollAction(_ sender: UISwitch!) {
        scrollView.isScrollEnabled = sender.isOn
    }

    @IBAction func shouldHideTitle(_ sender: UISwitch!) {
        textField2.iq.hidePlaceholder = !textField2.iq.hidePlaceholder
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let identifier = segue.identifier else {
            return
        }

        if identifier == "SettingsNavigationController" {

            let controller = segue.destination

            controller.modalPresentationStyle = .popover
            controller.popoverPresentationController?.barButtonItem = sender as? UIBarButtonItem

            let heightWidth = max(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
            controller.preferredContentSize = CGSize(width: heightWidth, height: heightWidth)
            controller.popoverPresentationController?.delegate = self
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }

    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }

    func prepareForPopoverPresentation(_ popoverPresentationController: UIPopoverPresentationController) {
        self.view.endEditing(true)
    }

    override var shouldAutorotate: Bool {
        return true
    }
}
