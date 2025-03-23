//
//  MainViewController.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 26.02.2025.
//

import UIKit
import SwiftUI
import SnapKit

enum ScreensType {
   case uiKit
   case swiftUI
}

class MainScreenViewController: BaseViewController {

	private let titleLabel: UILabel = {
		let label = UILabel()
		label.text = "A11Y\nDynamic font"
		label.numberOfLines = 0
		label.textColor = .white
		label.textAlignment = .center
		label.font = .customFont(style: .titleBlack, isDynamic: true)
		return label
	}()

	private let uiKitButton: UIButton = {
		var configuration = UIButton.Configuration.filled()
		configuration.title = "UIKit"
		configuration.baseBackgroundColor = .white
		configuration.cornerStyle = .large
		configuration.baseForegroundColor = .black
		return UIButton(configuration: configuration)
	}()

	private let swiftUIButton: UIButton = {
		var configuration = UIButton.Configuration.filled()
		configuration.title = "SwiftUI"
		configuration.baseBackgroundColor = .white
		configuration.cornerStyle = .large
		configuration.baseForegroundColor = .black
		return UIButton(configuration: configuration)
	}()

	private let aboutAppLabel: UILabel = {
		let label = UILabel()
		label.text = "Эти экраны нужны для того, чтобы показать возможности масштабирования шрифтов в приложении через глобальные и локальные флаги."
		label.textColor = .white
		label.textAlignment = .center
		label.numberOfLines = 0
		label.font = .customFont(style: .footnote, isDynamic: true)
		return label
	}()

	private let linkTextView: UITextView = {
		let textView = UITextView()
		textView.backgroundColor = .clear
		textView.text = "Шрифт Roboto\nhttps://fonts.google.com/specimen/Roboto"
		textView.textColor = .white
		textView.textAlignment = .center
		textView.isEditable = false
		textView.dataDetectorTypes = .link
		textView.font = .customFont(style: .footnote, isDynamic: true)
		return textView
	}()

	private let buttonStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.spacing = 10
		return stackView
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
		registerTraitDidChange()
	}

	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		super.traitCollectionDidChange(previousTraitCollection)
		if #unavailable(iOS 18.0) {
			resizeContentSizeCategory(previousTraitCollection: previousTraitCollection)
		}
	}

	private func registerTraitDidChange() {
		if #available(iOS 18.0, *) {
			registerForTraitChanges([UITraitPreferredContentSizeCategory.self]) { (self: Self, previousTraitCollection: UITraitCollection) in
				self.resizeContentSizeCategory(previousTraitCollection: previousTraitCollection)
			}
		}
	}

	private func setupViews() {
		buttonStackView.addArrangedSubviews([uiKitButton, swiftUIButton])
		buttonStackView.axis = fontSizeCategory > .normal ? .vertical : .horizontal

		let footerStackView = UIStackView()
		footerStackView.axis = .vertical
		footerStackView.spacing = 20
		footerStackView.distribution = .fillEqually
		footerStackView.addArrangedSubviews([aboutAppLabel, linkTextView])

		view.addSubviews([titleLabel, buttonStackView, footerStackView])

		titleLabel.snp.makeConstraints {
			$0.top.equalTo(view.safeAreaLayoutGuide).inset(40)
			$0.left.right.equalToSuperview().inset(20)
		}

		buttonStackView.snp.makeConstraints {
			$0.center.equalToSuperview().inset(20)
		}

		footerStackView.snp.makeConstraints {
			$0.top.equalTo(buttonStackView.snp.bottom).offset(40)
			$0.bottom.equalTo(view.safeAreaLayoutGuide)
			$0.left.right.equalToSuperview().inset(20)
		}

		uiKitButton.addAction(action(for: .uiKit), for: .touchUpInside)
		swiftUIButton.addAction(action(for: .swiftUI), for: .touchUpInside)

		setFont(for: [uiKitButton, swiftUIButton])
	}

	private func setFont(for buttons: [UIButton]) {
		for button in buttons {
			button.configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
				var outgoing = incoming
				outgoing.font = UIFont.customFont(style: .titleMedium, isDynamic: true)
				return outgoing
			}
		}
	}

	private func resizeContentSizeCategory(previousTraitCollection: UITraitCollection?) {
		if previousTraitCollection?.preferredContentSizeCategory != traitCollection.preferredContentSizeCategory {
			buttonStackView.axis = fontSizeCategory > .normal ? .vertical : .horizontal
		}
	}

	private func action(for screenType: ScreensType) -> UIAction {
		return UIAction { [weak self] _ in
			self?.openScreen(screenType: screenType)
		}
	}

	private func openScreen(screenType: ScreensType) {
		if case .uiKit = screenType {
			let controller = UIKitViewController()
			navigationController?.pushViewController(controller, animated: true)
		} else {
			let viewModel = ExampleSUIViewModel()
			let view = ExampleSUIView(viewModel: viewModel)
			let hostingController = SwiftUIViewControler(rootView: view)
			navigationController?.pushViewController(hostingController, animated: true)
		}
	}
}

// MARK: - Preview

#if DEBUG
#Preview {
	MainScreenViewController()
}
#endif
