
import Foundation

class BerlinCalendarPresenter : BerlinClockPresenterProtocol{
    
    var berlinClockView : BerlinClockView?
    let calendarCurrent = Calendar.current
    
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
        let calendarComponent =  calendarCurrent.dateComponents([.hour,.minute,.second], from : time)
        let minute = calendarComponent.minute
        let oneMinute = minute! % 5
        for (positionInArr,_) in valuesForSingleMinutesRowArr.enumerated() {
            if (positionInArr < oneMinute) {
                valuesForSingleMinutesRowArr[positionInArr] = BerlinClockUICellType.Yellow
            }else{
                break
            }
        }
        return valuesForSingleMinutesRowArr
    }
    
    func valuesForFiveMinutesRow(time: Date) -> [BerlinClockUICellType] {
        var defaultValuesForFiveMinutesRowArr = [BerlinClockUICellType](repeating: .Blank, count: FIVE_MINUTE_CELL_COUNT)
        let calendarComponent = calendarCurrent.dateComponents([.hour,.minute,.second], from : time)
        let minute = calendarComponent.minute
        let fiveMinutesCount = minute! / 5
        for (positionInArr,_) in defaultValuesForFiveMinutesRowArr.enumerated() {
            if (positionInArr < fiveMinutesCount) {
                if(positionInArr == 2 || positionInArr == 5 || positionInArr == 8){
                    defaultValuesForFiveMinutesRowArr[positionInArr] = .Red
                }else{
                    defaultValuesForFiveMinutesRowArr[positionInArr] = .Yellow
                }
            }else{
                break
            }
        }
        return defaultValuesForFiveMinutesRowArr;
    }
    
    func valuesForSingleHoursRow(time: Date) -> [BerlinClockUICellType] {
        var defaultValuesForSingleHourRowArr = [BerlinClockUICellType](repeating: .Blank, count: SINGLE_HOUR_CELL_COUNT)
        let calendarComponent = calendarCurrent.dateComponents([.hour,.minute,.second], from : time)
        let hour = calendarComponent.hour
        let singleHoursRow = hour! % 5
        for (positionInArr,_) in defaultValuesForSingleHourRowArr.enumerated() {
            if (positionInArr < singleHoursRow) {
                defaultValuesForSingleHourRowArr[positionInArr] = .Red
            }else{
                break
            }
        }
        return defaultValuesForSingleHourRowArr
    }
    
    func valuesForFiveHoursRow(time: Date) -> [BerlinClockUICellType] {
        var defaultValuesForFiveHourRowArr = [BerlinClockUICellType](repeating: .Blank, count: FIVE_HOUR_CELL_COUNT)
        let calendarComponent = calendarCurrent.dateComponents([.hour,.minute,.second], from : time)
        let hour = calendarComponent.hour
        let fiveHoursRow = hour! / 5
        for (positionInArr,_) in defaultValuesForFiveHourRowArr.enumerated() {
            if (positionInArr < fiveHoursRow) {
                defaultValuesForFiveHourRowArr[positionInArr] = .Red
            }else{
                break
            }
        }
        return defaultValuesForFiveHourRowArr
    }
    
    func valuesForSecondsRow(time: Date) -> [BerlinClockUICellType] {
        var defaultValuesForSecondsRowArr = [BerlinClockUICellType](repeating: .Blank, count: SECOND_CELL_COUNT)
        let calendarComponent = calendarCurrent.dateComponents([.hour,.minute,.second], from : time)
        let second = calendarComponent.second
        let secondsLamp = second! % 2
        if(secondsLamp == 0){
            defaultValuesForSecondsRowArr[0] = .Red
        }
        return defaultValuesForSecondsRowArr
    }
    
    func digitalToBerlin(time: Date) -> [[BerlinClockUICellType]] {
        let oneMinutesRow = self.valuesForSingleMinutesRow(time: time)
        let fiveMinutesRow = self.valuesForFiveMinutesRow(time: time)
        let oneHourRow = self.valuesForSingleHoursRow(time: time)
        let fiveHoursRow = self.valuesForFiveHoursRow(time: time)
        let secondsLamp = self.valuesForSecondsRow(time: time)
        
        let resultArr : [[BerlinClockUICellType]] = [secondsLamp,fiveHoursRow,oneHourRow,fiveMinutesRow,oneMinutesRow]
        
        return resultArr
    }
    
    func berlinToDigital(berlinDataArr: [BerlinClockUICellType]) -> String {
        var seconds = 1
        var hour = 0
        var minutes = 0
        for (positionInArr,berlinClockUICellType) in berlinDataArr.enumerated() {
            if(berlinClockUICellType != BerlinClockUICellType.Blank){
                switch positionInArr {
                case 0 :
                    seconds = 0
                case 1...4:
                    hour = hour + 5
                case 5...8:
                    hour = hour + 1
                case 9...19:
                    minutes = minutes + 5
                case 20...23:
                    minutes = minutes + 1
                default: break
                }
            }
        }
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let dateSetByComponent = calendarCurrent.date(bySettingHour: hour, minute: minutes, second: seconds, of: date)
        let timeInString = dateFormatter.string(from: dateSetByComponent!)
        return timeInString
    }
    
    func getBerlinClockDateFromThisTime(time: Date) {
        let berlinCellValuesToExploreInUI = digitalToBerlin(time: time)
        self.berlinClockView?.loadTimeValuesInBerlinClock(cellTypeArray: berlinCellValuesToExploreInUI)
    }
    
}
