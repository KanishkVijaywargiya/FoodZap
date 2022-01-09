//
//  NotificationManagerViewModel.swift
//  FoodZap (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 09/01/22.
//

import Foundation
import UserNotifications
import CoreLocation

/// Notifications
// singleton class
class NotificationManagerViewModel {
    static let instance = NotificationManagerViewModel() // singleton
    let defaults = UserDefaults(suiteName: "group.com.yourApp.bundleId")
    
    // requesting user for allowing notification
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        
        UNUserNotificationCenter.current().requestAuthorization(options: options) { success, error in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            } else {
                print("SUCCESS")
            }
        }
    }
    
    // schedule notification using time, calendar or location
    func scheduleNotification(title: String, label: String, userName: String, selectedDate: Date) {
        let content = UNMutableNotificationContent()
        content.title = "Hey\(userName == "" ? "!" : " \(userName)!")"
        content.subtitle = "Get ready to cook \(title) for \(label)"
        content.sound = .default
        content.badge = 1
        
        /// 3 types of notification -
        
        /// CALENDAR
        let calendar = Calendar.current
        let components = calendar.dateComponents([.month, .day, .year, .hour, .minute], from: selectedDate)
        
        var dateComponents = DateComponents()
        dateComponents.hour = 8
        dateComponents.minute = 0
        
        dateComponents.day = components.day
        dateComponents.month = components.month
        dateComponents.year = components.year
        
        let calendarTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        /// TIME
        //        let timeTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        
        /// LOCATION
        //        let coordinates = CLLocationCoordinate2D(latitude: 40.00, longitude: 50.00)
        //        let region = CLCircularRegion(center: coordinates, radius: 100, identifier: UUID().uuidString)
        //        region.notifyOnEntry = true
        //        region.notifyOnExit = false
        //        let locationTrigger = UNLocationNotificationTrigger(region: region, repeats: true)
        
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: calendarTrigger)
        
        UNUserNotificationCenter.current().add(request)
    }
    
    // for cancelling the notifications
    func cancelNotofication() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
    }
}
