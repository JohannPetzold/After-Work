//
//  DetailCocktailView.swift
//  Spotr After-Work
//
//  Created by Johann Petzold on 06/10/2021.
//

import SwiftUI
import UIKit

struct DetailCocktailView: View {
    
    @Binding var cocktail: Cocktail
    @Binding var showDetail: Bool
    @StateObject var favoritesVM: FavoritesViewModel
    let expandCell: Namespace.ID
    
    @State var isFavorite: Bool = false
    @State var showIngredient: Bool = false
    @State var showImage: Bool = false
    @State var presentActivity: Bool = false
    @State var activityController: ActivityViewController? = nil
    
    var body: some View {
        // Issue with the close button's GeometryEffect 
        GeometryReader { geometry in
            ZStack(alignment: .top) {
                Rectangle().foregroundColor(.white)
                VStack {
                    CellImage(imageName: $cocktail.name)
                        .matchedGeometryEffect(id: Animations.expandName(.image) + favoritesVM.animationId, in: expandCell)
                        .frame(height: geometry.size.height / 2.5)
                        .clipped()
                        .onTapGesture {
                            if UIImage(named: cocktail.name) != nil {
                                showImage = true
                            }
                        }
                    CellText(showIngredient: $showIngredient, cocktail: $cocktail, showDetail: true)
                        .matchedGeometryEffect(id: Animations.expandName(.text) + favoritesVM.animationId, in: expandCell)
                }
                .disabled(showImage)
                VStack {
                    HStack {
                        RoundedButton(icon: .close, size: .small, shadow: false, largerTouch: 2) {
                            withAnimation(Animations.expandCell()) {
                                favoritesVM.resetDetail()
                                showDetail.toggle()
                            }
                        }
                        Spacer()
                    }
                    .padding(EdgeInsets(top: UIDevice().hasNotch ? 50 : 20, leading: 0, bottom: 0, trailing: 0))
                    Spacer()
                    HStack {
                        Spacer()
                        if isFavorite {
                            RoundedButton(icon: .bookmarkSelected, size: .medium, shadow: true) {
                                favoritesVM.deleteCocktailData(cocktail: cocktail) { success in
                                    if success {
                                        isFavorite = false
                                    }
                                }
                            }
                            .matchedGeometryEffect(id: Animations.expandName(.bookmark) + favoritesVM.animationId, in: expandCell)
                        } else {
                            RoundedButton(icon: .bookmarkUnselected, size: .medium, shadow: true) {
                                favoritesVM.saveCocktailData(cocktail: cocktail) { success in
                                    if success {
                                        isFavorite = true
                                    }
                                }
                            }
                            .matchedGeometryEffect(id: Animations.expandName(.bookmark) + favoritesVM.animationId, in: expandCell)
                        }
                        RoundedButton(icon: .link, size: .medium, shadow: true) {
                            openUrl(urlString: cocktail.url)
                        }
                        RoundedButton(icon: .send, size: .medium, shadow: true) {
                            if activityController != nil {
                                presentActivity = true
                            }
                        }
                    }
                    .disabled(showImage)
                    .padding(.horizontal)
                    .offset(x: 0, y: 50 / 2)
                }
                .disabled(showImage)
                .frame(height: geometry.size.height / 2.5)
                if showImage {
                    ShowImageView(cocktail: $cocktail, showImage: $showImage)
                        .transition(Transitions.showDetailImage())
                        .zIndex(1)
                }
            }
            .edgesIgnoringSafeArea(.all)
            .background(activityController)
            .onAppear {
                favoritesVM.isCocktailInDatabase(cocktail: cocktail) { isIn in
                    if isIn {
                        isFavorite = true
                    }
                }
                if let newUrl = URL(string: cocktail.url) {
                    activityController = ActivityViewController(activityItems: [newUrl], isPresented: $presentActivity)
                }
                
            }
        }
    }
    
    private func openUrl(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        UIApplication.shared.open(url)
    }
}

struct DetailCocktailView_Previews: PreviewProvider {
    
    @Namespace static var previewId
    
    static var previews: some View {
        Group {
            DetailCocktailView(cocktail: .constant(Cocktail.previewCocktail()), showDetail: .constant(true), favoritesVM: FavoritesViewModel(), expandCell: previewId)
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
            DetailCocktailView(cocktail: .constant(Cocktail.previewCocktail()), showDetail: .constant(true), favoritesVM: FavoritesViewModel(), expandCell: previewId)
                .previewDevice(PreviewDevice(rawValue: "iPhone SE (2nd generation)"))
            DetailCocktailView(cocktail: .constant(Cocktail.previewCocktail()), showDetail: .constant(true), favoritesVM: FavoritesViewModel(), expandCell: previewId, showImage: true)
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
        }
    }
}
