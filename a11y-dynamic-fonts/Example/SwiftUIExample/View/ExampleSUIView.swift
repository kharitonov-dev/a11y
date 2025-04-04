//
//  SUIViewExample.swift
//  a11y-dynamic-fonts
//
//  Created by Харитонов Тимофей on 26.02.2025.
//

import SwiftUI

struct ExampleSUIView: View {
    
    // MARK: - Private properties
    
    @Environment(\.fontSizeCategory) private var fontSizeCategory
    @ObservedObject private var viewModel: ExampleSUIViewModel
    
    private var columns: [GridItem] {
        let minWidth: CGFloat = fontSizeCategory > .normal ? 180 : 120
        return [GridItem(.adaptive(minimum: minWidth))]
    }
    
    // MARK: - Construction
    
    init(viewModel: ExampleSUIViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Body
    
    var body: some View {
        ScrollView {
            VStack {
                A11yInfoView()
                
                ProfileView()
                    .padding(.top, 20)
                
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(viewModel.products) { product in
                        ProductCard(product: product)
                            .onTapGesture {
                                viewModel.toggleFavorite(for: product)
                            }
                    }
                }
                .padding(.top, 20)
            }
            .padding(.horizontal, 20)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        }
        .scrollIndicators(.hidden)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundStyle(.white)
        .background(.pink)
        .onChange(of: fontSizeCategory) { oldValue, newValue in
            print("⚠️ fontSizeCategory old value \(oldValue) and NEW VALUE \(newValue)")
        }
        .refreshable {
            viewModel.loadProducts()
        }
    }
}

// MARK: - Preview

#if DEBUG
#Preview {
	let viewModel = ExampleSUIViewModel()
	ExampleSUIView(viewModel: viewModel)
}
#endif
