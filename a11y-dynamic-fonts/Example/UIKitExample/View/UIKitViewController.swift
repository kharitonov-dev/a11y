//
//  ViewController.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 21.02.2025.
//

import UIKit
import SnapKit

class UIKitViewController: BaseViewController {

	// MARK: - Private properties

	private let presenter: ExamplePresenterProtocol = ExamplePresenter()
	private let switchStackView: UIStackView = UIStackView()
	private let switchTitle: UILabel = {
		let label = UILabel()
		label.text = "A11Y GLOBAL FLAG"
		label.textColor = .white
		label.font = .customFont(style: .headlineRegular, isDynamic: false)
		return label
	}()
	private let switchDescription: UILabel = {
		let label = UILabel()
		label.textColor = .white
		label.font = .customFont(style: .bodyLight, isDynamic: false)
		return label
	}()
	private let switcher = UISwitch()
	private let tableView: UITableView = {
		let tableView = UITableView()
		tableView.backgroundColor = .clear
		tableView.showsVerticalScrollIndicator = false
		tableView.separatorStyle = .none
		tableView.rowHeight = UITableView.automaticDimension
		tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 65, right: 0)
        tableView.sectionHeaderTopPadding = 0
		return tableView
	}()

	private lazy var sections: [SectionModel] = presenter.sectionsForExample

	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
		registerTraitDidChange()
	}

	private func registerTraitDidChange() {
		if #available(iOS 18.0, *) {
			registerForTraitChanges([UITraitPreferredContentSizeCategory.self]) { (self: Self, previousTraitCollection: UITraitCollection) in
				self.switchDescription.text = "Размер категории шрифта: \(self.fontSizeCategory)"
			}
		}
	}

	// MARK: - Private functions

	private func setupViews() {
		title = "UIKit Screen"

		switchDescription.text = "Размер категории шрифта: \(fontSizeCategory)"
		switchStackView.addArrangedSubviews([switchTitle, switcher])
		switcher.isOn = presenter.isActiveA11yGlobalFlag

		view.addSubviews([switchStackView, switchDescription, tableView])

		switchStackView.snp.makeConstraints {
			$0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
			$0.horizontalEdges.equalToSuperview().inset(20)
		}

		switchDescription.snp.makeConstraints {
			$0.top.equalTo(switchStackView.snp.bottom)
			$0.horizontalEdges.equalToSuperview().inset(20)
		}

		tableView.snp.makeConstraints {
			$0.top.equalTo(switchDescription.snp.bottom).offset(16)
			$0.left.right.bottom.equalToSuperview()
		}

		tableView.register(HeaderTableViewCell.self, forCellReuseIdentifier: "HeaderCell")
		tableView.register(SectionTableViewCell.self, forCellReuseIdentifier: "SectionCell")
		tableView.delegate = self
		tableView.dataSource = self

		switcher.addTarget(self, action: #selector(self.switchStateDidChange(_:)), for: .valueChanged)
	}

	@objc private func switchStateDidChange(_ sender: UISwitch) {
		presenter.a11yGlobalFlag(set: sender.isOn)
		tableView.reloadData()
	}
}

extension UIKitViewController: UITableViewDataSource, UITableViewDelegate {
	func numberOfSections(in tableView: UITableView) -> Int {
		return sections.count
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return sections[section].models.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "SectionCell") as? SectionTableViewCell else {
			return UITableViewCell()
		}

		let model = sections[indexPath.section].models[indexPath.row]
		let seporatorIsHidden = (indexPath.section == sections.count - 1) || (indexPath.row == sections[indexPath.section].models.count - 1)
        
		cell.delegate = self
		cell.setTitle(model.title)
        cell.setExampleText(model.example, style: model.style, isDynamic: model.isDynamicFontExampleText)
		cell.seporator(isHidden: seporatorIsHidden)
        
		return cell
	}

	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		guard let sectionTitle = sections[section].sectionHeader,
			  let cell: HeaderTableViewCell = tableView.dequeueReusableCell (withIdentifier: "HeaderCell") as? HeaderTableViewCell else {
			return nil
		}

		cell.set(title: sectionTitle)
		return cell.contentView
	}

	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 72
	}
}

extension UIKitViewController: SectionTableViewCellDelegate {
	func didSwitch(isOn: Bool, cell: UITableViewCell) {
		guard let cell = cell as? SectionTableViewCell,
			  let indexPath = tableView.indexPath(for: cell) else { return }
        
        sections[indexPath.section].models[indexPath.row].isDynamicFontExampleText = isOn
		tableView.reloadRows(at: [indexPath], with: .automatic)
	}
}

#if DEBUG
#Preview {
	UIKitViewController()
}
#endif
