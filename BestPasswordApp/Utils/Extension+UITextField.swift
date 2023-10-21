//
//  Extension+UITextField.swift
//  BestPasswordApp
//
//  Created by Игорь Никифоров on 18.10.2023.
//

import UIKit

extension UITextField {
	func setPasswordToggle() {
		let passwordToggleButton = UIButton(type: .custom)
		passwordToggleButton.setImage(UIImage(systemName: "eye.circle"), for: .normal)
		passwordToggleButton.setImage(UIImage(systemName: "eye.circle.fill"), for: .selected)
		passwordToggleButton.addTarget(self, action: #selector(passwordToggleButtonTapped), for: .touchUpInside)
		rightView = passwordToggleButton
		rightViewMode = .always
	}
	
	func setLeftImage() {
		let image = UIImage(systemName: "lock.fill")
		let imageView = UIImageView(image: image)

		leftView = imageView
		leftViewMode = .always
	}
	
	@objc func passwordToggleButtonTapped() {
		isSecureTextEntry.toggle()
		if let button = rightView as? UIButton {
			button.isSelected.toggle()
		}
	}
}
