//
//  CustomMapper.swift
//  Shotl
//
//  Created by Jordi Milla on 04/12/2019.
//  Copyright © 2019 Jordi Milla Catalan. All rights reserved.
//

import Foundation

public func meetingArrayTOMapper(value: [AppealTO]) -> [Appeal] {
    
    return value.map { countK -> Appeal in
        return Appeal(id: countK.id,
                      description: countK.description,
                      adjustExtraTime: countK.adjustExtraTime,
                      finalTime: countK.finalTime,
                      position: countK.position,
                      picture: countK.picture,
                      surname: countK.surname,
                      extraTime: countK.extraTime,
                      finalExtraTime: countK.finalExtraTime,
                      endDate: countK.endDate,
                      adjustWorkedTime: countK.adjustWorkedTime,
                      startDate: countK.startDate,
                      workedTime: countK.workedTime,
                      name: countK.name,
                      status: countK.status
        )
    }
}
