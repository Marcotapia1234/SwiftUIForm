//
//  Seting view.swift
//  SwiftUIForm
//
//  Created by Marco on 12/4/24.
//

import SwiftUI

struct Seting_view: View {
    private var displayOrders = [ "Alfabetico", "Primero favoritos", "Show Check-i n First"]
    @State private var selectedOrder = 0
    @State private var showCheckInOnly = false
    @State private var maxPriceLevel = 5
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Orden de preferencia")) {
                Picker(selection: $selectedOrder, label: Text("Despliega orden preferencia")) {
                        ForEach(0 ..< displayOrders.count, id: \.self) {
                            Text(self.displayOrders[$0])
                        }
                    
                    }
                }
                Section(header: Text("Elije el restaurant visitado")) {                Toggle(isOn: $showCheckInOnly) {
                        Text("Sólo los visitados")
                    
                    }
                    
                
                        Stepper(onIncrement: {
                            self.maxPriceLevel += 1
                            if self.maxPriceLevel > 5 {
                                self.maxPriceLevel = 5
                            }
                        }, onDecrement: {
                            self.maxPriceLevel -= 1
                            if self.maxPriceLevel < 1 {
                                self.maxPriceLevel = 1
                    } }) {
                    Text("Show \(String(repeating: "$", count: maxPriceLevel)) or below") }
                    }
                    
                }
            
                .navigationBarTitle("Settings")
        
        }
        
    }
}


struct Seting_view_Previews: PreviewProvider {
    static var previews: some View {
        Seting_view()
    }
 }

