import Foundation
import ObjectMapper

struct ResponseTO<T:Mappable>: Mappable {
    var data: T!
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        data <- map["data"]
    }
}


struct ResponseArryTO<T:Mappable>: Mappable {
    var data: [T]!
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        data <- map["data.contents.data"]
    }
}
