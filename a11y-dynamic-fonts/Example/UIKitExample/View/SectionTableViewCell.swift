//
//  SectionTableViewCell.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 26.02.2025.
//

import UIKit
import SnapKit

protocol SectionTableViewCellDelegate: AnyObject {
	func didSwitch(isOn: Bool, cell: UITableViewCell)
}

class SectionTableViewCell: UITableViewCell {

	weak var delegate: SectionTableViewCellDelegate?

	private let titleLabel: UILabel = {
		let label = UILabel()
		label.font = .customFont(style: .headlineBold)
		label.textColor = .white
		return label
	}()

	private let exampleLabel: UILabel = {
		let label = UILabel()
		label.numberOfLines = 0
		label.sizeToFit()
		label.textColor = .white
		return label
	}()

	private let separatorView: UIView = {
		let view = UIView()
		view.backgroundColor = .darkGray
		return view
	}()

	private let switcher = UISwitch()

	private var textExample: String?
	private var fontStyleExample: CustomFontStyle?

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupViews()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func setupViews() {
		selectionStyle = .none
		backgroundColor = .clear

		contentView.addSubviews([titleLabel, exampleLabel, separatorView, switcher])

		titleLabel.snp.makeConstraints {
			$0.top.equalToSuperview().inset(10)
			$0.horizontalEdges.equalToSuperview().inset(20)
		}

		exampleLabel.snp.makeConstraints {
			$0.top.equalToSuperview().offset(50)
			$0.left.right.equalToSuperview().inset(20)
			$0.bottom.equalToSuperview().inset(20)
		}

		separatorView.snp.makeConstraints {
			$0.height.equalTo(1)
			$0.width.equalToSuperview()
			$0.bottom.equalToSuperview()
		}

		switcher.snp.makeConstraints {
			$0.top.right.equalToSuperview().inset(10)
		}

		switcher.addTarget(self, action: #selector(self.switchStateDidChange(_:)), for: .valueChanged)
	}

	@objc private func switchStateDidChange(_ sender: UISwitch) {
		guard let textExample, let fontStyleExample else { return }
		setExampleText(textExample, style: fontStyleExample, isDynamic: sender.isOn)
		delegate?.didSwitch(isOn: sender.isOn, cell: self)
	}

	func a11yLocalFlag(set: Bool) {
		switcher.isOn = set
	}

	func setTitle(_ title: String) {
		titleLabel.attributedText = NSAttributedString.customAttributedString(title, style: .headlineBold, isDynamic: false)
	}

	func setExampleText(_ text: String, style: CustomFontStyle, isDynamic: Bool? = nil) {
		exampleLabel.attributedText = NSAttributedString.customAttributedString(text, style: style, isDynamic: isDynamic)
		textExample = text
		fontStyleExample = style
	}

	func seporator(isHidden: Bool) {
		separatorView.isHidden = isHidden
	}
}
