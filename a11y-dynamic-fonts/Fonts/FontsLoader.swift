//
//  FontsLoader.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 24.02.2025.
//

import UIKit

class FontsLoader {

    static let registerFonts: Void = {
        let dsBundle = Bundle(for: FontsLoader.self)

        guard let fontsResourceURL = dsBundle.resourceURL,
			  let fontsBundle = Bundle(url: fontsResourceURL) else { return }

        let fontsPaths = fontsBundle.paths(forResourcesOfType: "ttf", inDirectory: nil)
        
        for path in fontsPaths {
            registerFontWithPath(path, bundle: fontsBundle)
        }
    }()

    static func registerFontWithPath(_ path: String, bundle: Bundle) {

        guard let fontData = NSData(contentsOfFile: path) else {
            print("Failed to register font - data could not be loaded.")
            return
        }

        guard let dataProvider = CGDataProvider(data: fontData) else {
            print("Failed to register font - data provider could not be loaded.")
            return
        }

        guard let fontRef = CGFont(dataProvider) else {
            print("Failed to register font - could not be loaded.")
            return
        }

        var errorRef: Unmanaged<CFError>? = nil
        if (CTFontManagerRegisterGraphicsFont(fontRef, &errorRef) == false) {
            print("Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
        }
    }
}
