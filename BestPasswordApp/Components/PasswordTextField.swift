//
//  PasswordTextField.swift
//  BestPasswordApp
//
//  Created by Игорь Никифоров on 18.10.2023.
//

import UIKit

final class PasswordTextField: UIView {
	private(set) lazy var lockImageView: UIImageView = {
		let imageView = UIImageView(image: UIImage(systemName: "lock.fill"))
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	private(set) lazy var textField: UITextField = {
		let textField = UITextField()
		textField.translatesAutoresizingMaskIntoConstraints = false
		textField.isSecureTextEntry = false
		textField.delegate = self
		textField.keyboardType = .asciiCapable
		return textField
	}()

	private(set) lazy var eyeButton: UIButton = {
		let button = UIButton(type: .custom)
		button.translatesAutoresizingMaskIntoConstraints = false
		button.setImage(UIImage(systemName: "eye.circle"), for: .normal)
		button.setImage(UIImage(systemName: "eye.slash.circle"), for: .selected)
		button.addTarget(self, action: #selector(togglePasseordView(_:)), for: .touchUpInside)
		return button
	}()
	
	private(set) lazy var deviderView: UIView = {
		let view = UIView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .separator
		return view
	}()
	
	private(set) lazy var errorLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textColor = .systemRed
		label.font = .preferredFont(forTextStyle: .footnote)
		label.text = "Your password must meet the requirements below."
//		label.adjustsFontSizeToFitWidth = true
//		label.minimumScaleFactor = 0.0
		label.numberOfLines = 0
		label.lineBreakMode = .byWordWrapping
		label.isHidden = false
		return label
	}()
	
	// MARK: life style

	init(placeholder: String) {
		super.init(frame: .zero)

		style(placeholder: placeholder)
		setup()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override var intrinsicContentSize: CGSize {
		CGSize(width: 200, height: 60)
	}
}

// MARK: Private methods

private extension PasswordTextField {
	func style(placeholder: String) {
		translatesAutoresizingMaskIntoConstraints = false
		// backgroundColor = .systemOrange

		textField.placeholder = placeholder
		textField.attributedText = NSAttributedString(string: placeholder, attributes: [.foregroundColor: UIColor.secondaryLabel])
	}

	func setup() {
		addSubview(lockImageView)
		addSubview(textField)
		addSubview(eyeButton)
		addSubview(deviderView)
		addSubview(errorLabel)

		lockImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
		textField.setContentHuggingPriority(.defaultLow, for: .horizontal)
		eyeButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)

		// lock
		NSLayoutConstraint.activate([
			lockImageView.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
			lockImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
			lockImageView.leadingAnchor.constraint(equalToSystemSpacingAfter: self.leadingAnchor, multiplier: 0)
		])

		// textField
		NSLayoutConstraint.activate([
			textField.topAnchor.constraint(equalTo: topAnchor),
			textField.leadingAnchor.constraint(equalToSystemSpacingAfter: lockImageView.trailingAnchor, multiplier: 1)
		])

		// eyeButton
		NSLayoutConstraint.activate([
			eyeButton.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
			eyeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: textField.trailingAnchor, multiplier: 1),
			eyeButton.trailingAnchor.constraint(equalTo: trailingAnchor)

		])

		// devider
		NSLayoutConstraint.activate([
			deviderView.topAnchor.constraint(equalToSystemSpacingBelow: textField.bottomAnchor, multiplier: 1),
			deviderView.heightAnchor.constraint(equalToConstant: 1),
			deviderView.leadingAnchor.constraint(equalTo: leadingAnchor),
			deviderView.trailingAnchor.constraint(equalTo: trailingAnchor)
		])

		NSLayoutConstraint.activate([
			errorLabel.topAnchor.constraint(equalTo: deviderView.bottomAnchor, constant: 4),
			errorLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
			errorLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
		])
	}
}

// MARK: Actions

private extension PasswordTextField {
	@objc func togglePasseordView(_ sender: Any) {
		textField.isSecureTextEntry.toggle()
		eyeButton.isSelected.toggle()
	}
}

// MARK: UITextFieldDelegate

extension PasswordTextField: UITextFieldDelegate {

}
