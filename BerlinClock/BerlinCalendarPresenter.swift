
import Foundation

class BerlinCalendarPresenter : BerlinClockPresenterProtocol{
    
    var berlinClockView : BerlinClockView?
    
    func setBerlinClockView(berlinClockView: BerlinClockView) {
        self.berlinClockView = berlinClockView
    }
    
    let SINGLE_MINUTE_CELL_COUNT = 4
    let FIVE_MINUTE_CELL_COUNT = 11
    let SINGLE_HOUR_CELL_COUNT = 4
    let FIVE_HOUR_CELL_COUNT = 4
    let SECOND_CELL_COUNT = 1
    
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
    
    func valuesForFiveMinutesRow(time: Date) -> [BerlinClockUICellType] {
        let defaultValuesForFiveMinutesRowArr = [BerlinClockUICellType](repeating: .Blank, count: FIVE_MINUTE_CELL_COUNT)
        return defaultValuesForFiveMinutesRowArr;
    }
    
}
