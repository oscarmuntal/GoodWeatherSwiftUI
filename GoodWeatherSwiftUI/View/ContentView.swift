//
//  ContentView.swift
//  GoodWeatherSwiftUI
//
//  Created by Òscar Muntal on 5/4/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var weatherVM: WeatherViewModel
    
    init() {
        self.weatherVM = WeatherViewModel()
    }
    
    var body: some View {
        VStack(alignment: .center) {
            TextField("Enter city name", text: $weatherVM.cityName) {
                weatherVM.search()
            }
            .font(.custom("Arial", size: 50))
            .padding()
            .fixedSize()
            
            Text(weatherVM.temperature)
            .foregroundColor(Color.white)
            .offset(y: -100)
            .padding()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.green)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
