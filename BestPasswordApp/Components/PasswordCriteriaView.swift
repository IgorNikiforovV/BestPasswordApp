//
//  PasswordCriteriaView.swift
//  BestPasswordApp
//
//  Created by Игорь Никифоров on 21.10.2023.
//

import UIKit

final class PasswordCriteriaView: UIView {

	lazy private(set) var checkmarkImage = UIImage(systemName: "checkmark.circle")!.withTintColor(.systemGreen, renderingMode: .alwaysOriginal)
	lazy private(set) var xmarkImage = UIImage(systemName: "xmark.circle")!.withTintColor(.systemRed, renderingMode: .alwaysOriginal)
	lazy private(set) var circleImage = UIImage(systemName: "circle")!.withTintColor(.tertiaryLabel, renderingMode: .alwaysOriginal)

	var isCriteriaMet: Bool = false {
		didSet {
			rightImageView.image = isCriteriaMet ? checkmarkImage : xmarkImage
		}
	}

	func reset() {
		isCriteriaMet = false
		rightImageView.image = circleImage
	}

	override var intrinsicContentSize: CGSize {
		CGSize(width: 200, height: 40)
	}

	// MARK: Lyfe circle

	private(set) lazy var stackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .horizontal
		stackView.spacing = 8
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()

	private(set) lazy var rightImageView: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()

	private(set) lazy var textLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.numberOfLines = 1
		label.font = .preferredFont(forTextStyle: .subheadline)
		return label
	}()

	// MARK: life circle

	init(text: String) {
		super.init(frame: .zero)

		textLabel.text = text
		setup()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: Private methods

private extension PasswordCriteriaView {
	func setup() {
		addSubview(stackView)
		stackView.addArrangedSubview(rightImageView)
		stackView.addArrangedSubview(textLabel)

		translatesAutoresizingMaskIntoConstraints = false

		// stackView
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: topAnchor),
			stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
			stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
		])

		// image
		NSLayoutConstraint.activate([
			rightImageView.heightAnchor.constraint(equalTo: rightImageView.widthAnchor)
		])

		// CHCR
		rightImageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
		textLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
	}
}
