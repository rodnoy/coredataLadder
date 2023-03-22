//
//  SectionView.swift
//  HelloCoreData
//
//  Created by KIRILL SIMAGIN on 21/03/2023.
//

import SwiftUI

struct SectionView: View {
    var body: some View {
        SectionGroupView(sectionTitle: "MySection") {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        
    }
}

struct SectionGroupView<Content>: View where Content: View {
    
    var sectionTitle: String
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        VStack {
            Text(sectionTitle)
                .foregroundColor(Color(hex:"9BD7D1"))
                .font(.caption)
            
            Divider().frame(width: 44)
            content()
        }
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        SectionView()
    }
}
