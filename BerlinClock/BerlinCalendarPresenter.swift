
import Foundation

class BerlinCalendarPresenter{
    
    func valuesForSingleMinutesRow(time : Date) -> [BerlinClockUICellType]{
        let valuesForSingleMinutesRowArr = [BerlinClockUICellType](repeating: .Blank, count: 4)
        return valuesForSingleMinutesRowArr
    }
}
