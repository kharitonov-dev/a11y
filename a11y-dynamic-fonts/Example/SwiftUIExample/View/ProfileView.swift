//
//  ProfileView.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 22.03.2025.
//

import SwiftUI

struct ProfileView: View {

	@Environment(\.fontSizeCategory) private var fontSizeCategory

	var body: some View {
		VStack(alignment: .leading) {
			Text("Профиль")
				.font(.customFont(style: .headlineBold, isDynamic: true))
			HStack(alignment: .center) {
				Image(.ava)
					.frame(width: 72, height: 72)
					.clipShape(.rect(cornerRadius: 20))

				VStack(alignment: .leading) {
					Text("Мама")
						.font(.customFont(style: .headlineMedium, isDynamic: true))

					Text("+7 000 444-33-22")
						.font(.customFont(style: .headlineRegular, isDynamic: true))
				}
				.padding(.leading, 10)
			}
		}
		.frame(maxWidth: .infinity, alignment: .topLeading)
	}
}

#Preview {
	ProfileView()
}
