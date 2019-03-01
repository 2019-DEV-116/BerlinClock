
import Foundation

protocol BerlinClockPresenterProtocol{
    
    func setBerlinClockView(berlinClockView : BerlinClockView)
    
    func valuesForSingleMinutesRow(time : Date) -> [BerlinClockUICellType]
    
    func valuesForFiveMinutesRow(time : Date) -> [BerlinClockUICellType]
    
    func valuesForSingleHoursRow(time : Date) -> [BerlinClockUICellType]
    
    func valuesForFiveHoursRow(time : Date) -> [BerlinClockUICellType]
    
    func valuesForSecondsRow(time : Date) -> [BerlinClockUICellType]
    
}
