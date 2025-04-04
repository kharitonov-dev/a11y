//
//  A11yInfoView.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 22.03.2025.
//

import SwiftUI

struct A11yInfoView: View {
    
    // MARK: - Private properties

	@Environment(\.fontSizeCategory) private var fontSizeCategory
    
    // MARK: - Body

	var body: some View {
		VStack(alignment: .center) {
            HStack {
                Text("Размер категории шрифта:")
                    .font(.customFont(style: .bodyRegular, isDynamic: false))
                Text(".\(fontSizeCategory)")
                    .font(.customFont(style: .bodyMedium, isDynamic: false))
            }
			Text("Примеры динамической верстки")
				.font(.customFont(style: .bodyRegular, isDynamic: false))
		}
	}
}

// MARK: - Preview

#if DEBUG
#Preview {
	A11yInfoView()
}
#endif
