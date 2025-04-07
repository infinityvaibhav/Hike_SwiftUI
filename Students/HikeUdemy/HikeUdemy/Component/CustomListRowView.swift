//
//  CustomListRow.swift
//  HikeUdemy
//
//  Created by Vaibhav Upadhyay on 22/02/25.
//
import SwiftUI

struct CustomListRowView: View {
    
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String?
    @State var rowTintColor: Color
    @State var rowLinkLabel: String?
    @State var rowLinkDestination: String?
    
    var body: some View {
        LabeledContent {
            if let rowContent {
                Text(rowContent)
                    .foregroundStyle(.primary)
                    .fontWeight(.regular)
            } else if let rowLinkLabel,
                      let rowLinkDestination,
                      let link = URL(string: rowLinkDestination) {
                    Link(rowLinkLabel, destination: link)
            } else {
                EmptyView()
            }
        } label: {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List {
        CustomListRowView(
            rowLabel: "Designer",
            rowIcon: "paintpalette",
            rowContent: "John Doe",
            rowTintColor: .pink
        )
    }
}
