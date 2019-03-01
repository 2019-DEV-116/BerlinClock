
import XCTest
@testable import BerlinClock

class BerlinClockTests: XCTestCase {

    var dateFormatter : DateFormatter?
    var berlinCalendarPresenter = BerlinCalendarPresenter()
    typealias cellType = BerlinClockUICellType
    
    override func setUp() {
        dateFormatter = DateFormatter()
        dateFormatter!.dateFormat = "HH:mm:ss"
    }
    
    override func tearDown() {
        
    }
    
    func testOneMinuteBlockResultForGiveTime() {
        let testOne = dateFormatter!.date(from: "23:59:59")
        let testOneExpectedResult = [cellType.Yellow,cellType.Yellow,cellType.Yellow,cellType.Yellow]
        
        let valuesForSingleMinutesRowArr = berlinCalendarPresenter.valuesForSingleMinutesRow(time:testOne!)
        
        XCTAssertEqual(valuesForSingleMinutesRowArr, testOneExpectedResult)
    }

}
