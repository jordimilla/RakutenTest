import Foundation
import ObjectMapper

public struct AppealTO {
    var id: Int!
    var description: String!
    var adjustWorkedTime: Double!
    var adjustExtraTime: Double!
    var finalTime: Double!
    var position: String!
    var surname: String!
    var picture: String!
    var extraTime: Double!
    var finalExtraTime: Double!
    var endDate: String!
    var startDate: String!
    var workedTime: Double!
    var name: String!
    var status: String!
    
}

extension AppealTO: Mappable{
    
    public init?(map: Map) {
    }
    
    public mutating func mapping(map: Map) {
        id <- map["id"]
        description <- map["description"]
        adjustWorkedTime <- map["adjustWorkedTime"]
        adjustExtraTime <- map["adjustExtraTime"]
        finalTime <- map["finalTime"]
        position <- map["position"]
        surname <- map["surname"]
        picture <- map["picture"]
        extraTime <- map["extraTime"]
        finalExtraTime <- map["finalExtraTime"]
        endDate <- map["endDate"]
        startDate <- map["startDate"]
        workedTime <- map["workedTime"]
        name <- map["name"]
        status <- map["status"]
    }
}
