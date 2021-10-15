import UIKit

import UIKit
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true


struct NestedJSONModel: Codable {
    let embedded: TicketMaster
   

    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
    }
}


struct TicketMaster: Codable {
    let events: [Event]
}


struct Event: Codable {
    let name:String?
    let url:String?
    

    enum CodingKeys: String, CodingKey {
        case name
        case url
    }
}

let url = URL(string: "https://app.ticketmaster.com/discovery/v2/events.json?venueId=KovZpZAFJvvA&apikey=YOURAPIKEY")!

var request = URLRequest(url: url)



let task = URLSession.shared.dataTask(with: request) { data, response, error in
    
    if let response = response {
   

    if let data = data, let body = String(data: data, encoding: .utf8) {
//      print(body)
      print(data)
        
    }
  } else {
      
    print(error ?? "Unknown error")
      
  }
    let decoder = JSONDecoder()
    
    let json = try! JSONDecoder().decode(NestedJSONModel.self, from: data!)
    
    print(json)
}

task.resume()
