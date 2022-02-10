//
//  ContentView.swift
//  VentilateReminder
//
//  Created by Yury Prokhorov on 09.02.2022.
//

import SwiftUI
import UserNotifications

struct ContentView: View {
    var body: some View {
        VStack {
            
            //TODO: Если есть разрешение, то показать кнопку с реквестом, если нет, то с шкедулом
            
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            .frame(width: 100, height: 100)
            .border(.green)
            .background(.green)
            .padding()

            Button("Schedule Notification") {
                let content = UNMutableNotificationContent()
                content.title = "Open the window"
                content.subtitle = "Hey mate, you need to open the window right now!"
                content.sound = UNNotificationSound.default

                // show this notification five seconds from now
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1800, repeats: true)

                // choose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                // add our notification request
                UNUserNotificationCenter.current().add(request)

            }
            .frame(width: 100, height: 100)
            .border(.blue)
            .background(.blue)
            .foregroundColor(.red)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
