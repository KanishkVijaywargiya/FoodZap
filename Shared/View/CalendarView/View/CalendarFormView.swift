//
//  CalendarFormView.swift
//  FoodZap (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 26/12/21.
//

import SwiftUI
import AwesomeToast

struct CalendarFormView: View {
    let title: String
    @State private var label = "Breakfast"
    @State private var birthdatefu = Date()
    @Binding var scheduleFoodToast: Bool
    
    let labels = ["Breakfast", "Lunch", "Snacks", "Dinner"]
    var bgColors = ["#EA425C", "#E83350", "#74B9FF", "#3498DB", "#4BCFFA", "#25CCF7", "#67E6DC", "#0ABDE3", "#7CEC9F", "#53E0BC", "#75DA8B", "#2ECC72", "#F3B63A", "#01CBC6", "#8B78E6", "#00CCCD", "#FFB9B9"].shuffled().randomElement()
    
    @StateObject var hapticVM = HapticViewModel()
    @EnvironmentObject var calendarDt: CalendarVM
    @Environment(\.dismiss) var dismissMode
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Text(title)
                    Picker("Type", selection: $label) {
                        ForEach(labels, id: \.self) {
                            Text($0)
                        }
                    }
                    DatePicker("Select date for cooking food", selection: $birthdatefu, in: Date()..., displayedComponents: .date)
                }
                
                Button(action: {
                    hapticVM.impact(style: .soft)
                    hapticVM.haptic(type: .success)
                    self.scheduleFoodToast = true
                    let item = CalendarModal(title: title, label: label, todayDate: birthdatefu, bgColor: bgColors ?? "#EA425C")
                    calendarDt.items.append(item)
                    dismissMode()
                }) {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.green)
                }
                .tint(.green)
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
                .padding()
            }
            .navigationTitle("Add new schedule")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct CalendarFormView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarFormView(title: "", scheduleFoodToast: .constant(false))
    }
}


