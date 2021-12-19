//
//  NetworkReachability.swift
//  FoodZap (iOS)
//
//  Created by KANISHK VIJAYWARGIYA on 19/12/21.
//

import Foundation
import Network

final class NetworkReachability: ObservableObject {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    
    @Published var isConnected = true
    
    init() {
        monitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied ? true : false
            }
        }
        monitor.start(queue: queue)
    }
}
