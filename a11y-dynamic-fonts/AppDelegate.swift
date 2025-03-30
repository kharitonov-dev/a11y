//
//  AppDelegate.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 21.02.2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		UIFont.registerFonts(isDynamic: true)

		let appearance = UINavigationBarAppearance()
		appearance.configureWithDefaultBackground()
		appearance.titleTextAttributes = [
			.foregroundColor: UIColor.white,
			.font: UIFont.customFont(style: .bodyRegular, isDynamic: false)
		]
		appearance.backButtonAppearance.normal.titleTextAttributes = [.font: UIFont.systemFont(ofSize: .zero)]
		UINavigationBar.appearance().standardAppearance = appearance
		UINavigationBar.appearance().tintColor = .white

		let rootViewController = MainScreenViewController()
		let navigationController = UINavigationController(rootViewController: rootViewController)

		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = navigationController
		window?.makeKeyAndVisible()

		return true
	}


}

