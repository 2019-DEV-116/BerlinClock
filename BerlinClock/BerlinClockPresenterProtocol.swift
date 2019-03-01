
import Foundation

protocol BerlinClockPresenterProtocol{
    
    func setBerlinClockView(berlinClockView : BerlinClockView)
    
    func valuesForSingleMinutesRow(time : Date) -> [BerlinClockUICellType]
    
    func valuesForFiveMinutesRow(time : Date) -> [BerlinClockUICellType]
    
}
