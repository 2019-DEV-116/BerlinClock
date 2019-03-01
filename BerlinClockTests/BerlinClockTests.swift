
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
        let testTwo = dateFormatter!.date(from: "00:00:00")
        let testTwoExpectedResult = [cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank]
        let testThree = dateFormatter!.date(from: "12:32:00")
        let testThreeExpectedResult = [cellType.Yellow,cellType.Yellow,cellType.Blank,cellType.Blank]
        let testFour = dateFormatter!.date(from: "12:34:00")
        let testFourExpectedResult = [cellType.Yellow,cellType.Yellow,cellType.Yellow,cellType.Yellow]
        let testFive = dateFormatter?.date(from: "12:35:00")
        let testFiveExpectedResult = [cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank]
        
        let valuesForSingleMinutesRowArrTestOne = berlinCalendarPresenter.valuesForSingleMinutesRow(time:testOne!)
        let valuesForSingleMinutesRowArrTestTwo = berlinCalendarPresenter.valuesForSingleMinutesRow(time:testTwo!)
        let valuesForSingleMinutesRowArrTestThree = berlinCalendarPresenter.valuesForSingleMinutesRow(time:testThree!)
        let valuesForSingleMinutesRowArrTestFour = berlinCalendarPresenter.valuesForSingleMinutesRow(time:testFour!)
        let valuesForSingleMinutesRowArrTestFive = berlinCalendarPresenter.valuesForSingleMinutesRow(time:testFive!)
        
        XCTAssertEqual(valuesForSingleMinutesRowArrTestOne, testOneExpectedResult)
        XCTAssertEqual(valuesForSingleMinutesRowArrTestTwo, testTwoExpectedResult)
        XCTAssertEqual(valuesForSingleMinutesRowArrTestThree, testThreeExpectedResult)
        XCTAssertEqual(valuesForSingleMinutesRowArrTestFour, testFourExpectedResult)
        XCTAssertEqual(valuesForSingleMinutesRowArrTestFive, testFiveExpectedResult)
        XCTAssertNotEqual(valuesForSingleMinutesRowArrTestOne, testTwoExpectedResult)
    }

}
