import Foundation
import ObjectMapper

public struct ResponseTO<T:Mappable>: Mappable {
    var meta: T!
   
    public init?(map: Map) {
    }
    
    public mutating func mapping(map: Map) {
        meta <- map["meta"]
    }
}


public struct ResponseArryTO<T:Mappable>: Mappable {
    var meta: [T]!

    public init?(map: Map) {
    }
    
    public mutating func mapping(map: Map) {
        meta <- map["meta"]
    }
}
