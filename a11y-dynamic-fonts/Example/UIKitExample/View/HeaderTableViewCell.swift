//
//  HeaderTableViewCell.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 26.02.2025.
//

import UIKit
import SnapKit

class HeaderTableViewCell: UITableViewCell {

	private let titleLabel: UILabel = {
		let label = UILabel()
		label.textColor = .white
		label.font = .customFont(style: .titleBlack, isDynamic: false)

		return label
	}()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupViews()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func set(title: String) {
		titleLabel.text = "Раздел: \(title)"
	}

	private func setupViews() {
		contentView.backgroundColor = .blue.withAlphaComponent(0.5)
		contentView.addSubviews([titleLabel])

		titleLabel.snp.makeConstraints {
			$0.left.equalTo(contentView).inset(20)
			$0.centerY.equalTo(contentView)
		}
	}
}
