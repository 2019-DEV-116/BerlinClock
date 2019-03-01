
import Foundation

class BerlinCalendarPresenter{
    
    let SINGLE_MINUTE_CELL_COUNT = 4
    
    func valuesForSingleMinutesRow(time : Date) -> [BerlinClockUICellType]{
        var valuesForSingleMinutesRowArr = [BerlinClockUICellType](repeating: .Blank, count: SINGLE_MINUTE_CELL_COUNT)
        let calendarCurrent = Calendar.current
        let calendarComponent =  calendarCurrent.dateComponents([.hour,.minute,.second], from : time)
        let minute = calendarComponent.minute
        let oneMinute = minute! % 5
        for (index,_) in valuesForSingleMinutesRowArr.enumerated() {
            if (index < oneMinute) {
                valuesForSingleMinutesRowArr[index] = BerlinClockUICellType.Yellow
            }else{
                break
            }
        }
        return valuesForSingleMinutesRowArr
    }
}
