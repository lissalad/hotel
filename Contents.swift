import UIKit

class Hotel {
  var address: String
  var numberOfRooms: Int
  var manager: Manager
  
  init(address: String, numberOfRooms: Int, manager: Manager) {
    self.address = address
    self.numberOfRooms = numberOfRooms
    self.manager = manager
  }
}

enum RoomSize {
  case single
  case double
  case triple
  case quad
}

class Room {
  let roomNumber: Int
  let size: RoomSize
  var pricePerNight: Double
  
  init(roomNumber: Int, size: RoomSize) {
    self.roomNumber = roomNumber
    self.size = size
    
    switch size {
    case .single:
      self.pricePerNight = 10.0
    case .double:
      self.pricePerNight = 20.0
    case .triple:
      self.pricePerNight = 30.0
    case .quad:
      self.pricePerNight = 40.0
    }
  }
}

class Person {
  let name: String
  
  init(name: String) {
    self.name = name
  }
  
}

class Manager:Person {
}

class Guest:Person {
  var hasPet: Bool
  
  init(name: String, hasPet: Bool) {
    self.hasPet = hasPet
    super.init(name: name)
  }
}

class Booking {
  let guest: Guest
  let days: Int
  let room: Room
  var totalCost: Double
  
  init(guest: Guest, days: Int, room: Room) {
    self.guest = guest
    self.days = days
    self.room = room
    self.totalCost = 0
    self.totalCost = calculateTotal()
  }
  
  func calculateTotal() -> Double {
    var cost = room.pricePerNight * Double(days)
    if (guest.hasPet) {
      cost += 25.0 * Double(days)
    }
    return cost
  }
  
  func displayBooking() {
    let message = "That will be $\(totalCost) for your \(days) day stay. Enjoy your visit, \(guest.name)."
    print(message)
  }
}

// -------- TEST --------------------------- //

let overlookManager: Manager = Manager(name: "Stuart Ullman")
let overlook: Hotel = Hotel(address: "407 Mountain Boulder CO", numberOfRooms: 237, manager: overlookManager)
let lissa: Guest = Guest(name: "Lissa", hasPet: true)
let lissaRoom: Room = Room(roomNumber: 217, size: RoomSize.single)
let lissaTrip: Booking = Booking(guest: lissa, days: 4, room: lissaRoom)
lissaTrip.displayBooking()
