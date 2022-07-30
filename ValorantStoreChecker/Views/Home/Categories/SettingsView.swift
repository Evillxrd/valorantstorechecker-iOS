//
//  SettingsView.swift
//  ValorantStoreChecker
//
//  Created by Gordon Ng on 2022-07-16.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var skinModel : SkinModel
    @EnvironmentObject var authAPIModel : AuthAPIModel
    
    @State var dark = false
    @State var isDetailViewShowing = false
    
    let defaults = UserDefaults.standard
    
    var body: some View {
        
        GeometryReader{ geo in
            
            VStack(alignment: .leading, spacing: 10){
                
                Text("Settings")
                    .font(.title)
                    .bold()
                
                //Toggle("Wish List Notifications", isOn: $dark)
                //    .tint(.pink)
                     
                HStack{
                    Image(systemName: "person.circle")
                    Text(defaults.string(forKey: "username") ?? "")
                }
                
                
                Button {
                    
                    authAPIModel.signout()
                    
                } label: {
                    
                    ZStack{
                        
                        RectangleView(colour: .pink)
                            .frame(height: 48)
                            .shadow(color: .pink, radius: 5)
                        Text("Log Out")
                            .foregroundColor(.white)
                            .padding()
                        
                    }
                }
                
                Spacer()
                
            }
            .foregroundColor(.white)
        }
        .padding()
        .padding(10)
    }
}

struct SettingsView_Previews: PreviewProvider {
    
    static var previews: some View {
        SettingsView()
    }
}



