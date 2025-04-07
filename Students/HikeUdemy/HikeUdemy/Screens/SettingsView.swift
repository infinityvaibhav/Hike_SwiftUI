//
//  SettingsView.swift
//  HikeUdemy
//
//  Created by Vaibhav Upadhyay on 22/02/25.
//
import SwiftUI

struct SettingsView: View {
    
    private let alternateAppicons: [String] = [
        "AppIcon-Backpack",
        "AppIcon-Camera",
        "AppIcon-Campfire",
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom"
    ]
    
    var body: some View {
        List {
            //MARK: - Section Header
            Section {
                HStack{
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editor's Choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(colors: [
                        .customGreenLight,
                        .customGreenMedium,
                        .customGreenDark
                    ], startPoint: .top, endPoint: .bottom)
                )
                .padding(.top, 8)
                
                VStack(alignment: .center, spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    Text("The hike which looks gorgeous in photos but is even better once you are actully there. The hike that you hope to do again someday. \nFind the best hikes in the app.")
                        .font(.footnote)
                        .italic()
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundStyle(Color.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
                
            } // Header
            .listRowSeparator(.hidden)
            
            //MARK: - Section Icon
            
            Section(header: Text("Alternate Icons")) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(alternateAppicons.indices, id: \.self) { item in
                            Button {
                                print("Icon \(alternateAppicons[item]) was pressed")
                                if UIApplication.shared.supportsAlternateIcons {
                                    UIApplication.shared.setAlternateIconName(alternateAppicons[item]) { error in
                                        if error != nil {
                                            print("Failed updated to app icon \(String(describing: error))")
                                        } else {
                                            print("Success! you have changed the app icon to \(alternateAppicons[item])")
                                        }
                                    }
                                }
                            } label: {
                                Image("\(alternateAppicons[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                } // ScrollView
                .padding(.top, 12)
                
                Text("Choose your favourite app icon from the collection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            } // Section Alternate Icons
            .listRowSeparator(.hidden)
            
            //MARK: - Section About
            Section(
                header: Text("About the App"),
                footer: HStack {
                    Spacer()
                    Text("Copyright © All right reserved 2025.")
                    Spacer()
                    }
                    .padding(.vertical, 8)
            ) {
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .blue)
                
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .red)
                
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .gray)
                
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "John Doe", rowTintColor: .mint)
                
                CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Robert Petras", rowTintColor: .pink)
                
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowContent: "http://credo.acedemy", rowTintColor: .indigo)
            }
        }
    }
}

#Preview {
    SettingsView()
}
