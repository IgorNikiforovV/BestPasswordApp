//
//  ViewController.swift
//  BestPasswordApp
//
//  Created by Игорь Никифоров on 16.10.2023.
//

import UIKit

final class ViewController: UIViewController {
	
	let passwordView = PasswordTextField(placeholder: "New password")
	let stackView: UIStackView = {
		let view = UIStackView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.axis = .vertical
		view.spacing = 20
		view.alignment = .fill
		return view
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		
		style()
		layout()
	}
	
	override func viewWillLayoutSubviews() {
		super.viewWillLayoutSubviews()
		

	}
}

extension ViewController {
	func style() {
		passwordView.translatesAutoresizingMaskIntoConstraints = false
		
		view.addSubview(stackView)
		//stackView.addArrangedSubview(passwordView)

		let passwordCriteriaView = PasswordCriteriaView(text: "uppercase letter (A-Z)")

		stackView.addArrangedSubview(passwordCriteriaView)
	}

	func layout() {
		NSLayoutConstraint.activate([
			stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
			view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
			stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
		])
	}
}

