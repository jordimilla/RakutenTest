import Foundation

public class Meeting {

    public let id: Int
    public let description: String
    public let adjustExtraTime: Double
    public let finalTime: Double
    public let position: String
    public let picture: String
    public let surname: String
    public let extraTime: Double
    public let finalExtraTime: Double
    public let endDate: String
    public let adjustWorkedTime: Double
    public let startDate: String
    public let workedTime: Double
    public let name: String
    public let status: String
    
    public init(id: Int, description: String, adjustExtraTime: Double,
                finalTime: Double, position: String,
                picture: String, surname: String, extraTime: Double,
                finalExtraTime: Double, endDate: String,
                adjustWorkedTime: Double, startDate: String,
                workedTime: Double, name: String,
                status: String) {
           self.id = id
           self.description = description
           self.adjustExtraTime = adjustExtraTime
           self.finalTime = finalTime
           self.position = position
           self.picture = picture
           self.surname = surname
           self.extraTime = extraTime
           self.finalExtraTime = finalExtraTime
           self.endDate = endDate
           self.adjustWorkedTime = adjustWorkedTime
           self.startDate = startDate
           self.workedTime = workedTime
           self.name = name
           self.status = status
       }
    
}
