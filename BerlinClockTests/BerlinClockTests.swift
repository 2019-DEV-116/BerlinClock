
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
    
    func testFiveMinuteBlockResultForGivenTime(){
        let testOne = dateFormatter!.date(from: "23:59:59")
        let testOneExpectedResult = [cellType.Yellow,cellType.Yellow,cellType.Red,cellType.Yellow,cellType.Yellow,cellType.Red,cellType.Yellow,cellType.Yellow,cellType.Red,cellType.Yellow,cellType.Yellow]
        let testTwo = dateFormatter!.date(from: "00:00:00")
        let testTwoExpectedResult = [cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank]
        let testThree = dateFormatter!.date(from: "12:04:00")
        let testThreeExpectedResult = [cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank]
        let testFour = dateFormatter!.date(from: "12:23:00")
        let testFourExpectedResult = [cellType.Yellow,cellType.Yellow,cellType.Red,cellType.Yellow,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank]
        let testFive = dateFormatter!.date(from: "12:35:00")
        let testFiveExpectedResult = [cellType.Yellow,cellType.Yellow,cellType.Red,cellType.Yellow,cellType.Yellow,cellType.Red,cellType.Yellow
            ,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank]
        
        let testOneResult = berlinCalendarPresenter.valuesForFiveMinutesRow(time : testOne!)
        let testTwoResult = berlinCalendarPresenter.valuesForFiveMinutesRow(time : testTwo!)
        let testThreeResult = berlinCalendarPresenter.valuesForFiveMinutesRow(time : testThree!)
        let testFourResult = berlinCalendarPresenter.valuesForFiveMinutesRow(time : testFour!)
        let testFiveResult = berlinCalendarPresenter.valuesForFiveMinutesRow(time : testFive!)
        
        XCTAssertEqual(testOneExpectedResult, testOneResult)
        XCTAssertEqual(testTwoExpectedResult, testTwoResult)
        XCTAssertEqual(testThreeExpectedResult, testThreeResult)
        XCTAssertEqual(testFourExpectedResult, testFourResult)
        XCTAssertEqual(testFiveExpectedResult, testFiveResult)
        XCTAssertNotEqual(testOneExpectedResult, testTwoResult)
    }
    
    func testOneHourBlockResultForGivenTime(){
        let testOne = dateFormatter!.date(from: "23:59:59")
        let testOneExpectedResult = [cellType.Red,cellType.Red,cellType.Red,cellType.Blank]
        let testTwo = dateFormatter!.date(from: "00:00:00")
        let testTwoExpectedResult = [cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank]
        let testThree = dateFormatter!.date(from: "02:04:00")
        let testThreeExpectedResult = [cellType.Red,cellType.Red,cellType.Blank,cellType.Blank]
        let testFour = dateFormatter!.date(from: "08:23:00")
        let testFourExpectedResult = [cellType.Red,cellType.Red,cellType.Red,cellType.Blank]
        let testFive = dateFormatter!.date(from: "14:35:00")
        let testFiveExpectedResult = [cellType.Red,cellType.Red,cellType.Red,cellType.Red]
        
        let testOneResult = berlinCalendarPresenter.valuesForSingleHoursRow(time: testOne!)
        let testTwoResult = berlinCalendarPresenter.valuesForSingleHoursRow(time: testTwo!)
        let testThreeResult = berlinCalendarPresenter.valuesForSingleHoursRow(time: testThree!)
        let testFourResult = berlinCalendarPresenter.valuesForSingleHoursRow(time: testFour!)
        let testFiveResult = berlinCalendarPresenter.valuesForSingleHoursRow(time: testFive!)
        
        XCTAssertEqual(testOneExpectedResult, testOneResult)
        XCTAssertEqual(testTwoExpectedResult, testTwoResult)
        XCTAssertEqual(testThreeExpectedResult, testThreeResult)
        XCTAssertEqual(testFourExpectedResult, testFourResult)
        XCTAssertEqual(testFiveExpectedResult, testFiveResult)
        XCTAssertNotEqual(testOneExpectedResult, testTwoResult)
    }
    
    func testFiveHourBlockResultForGivenTime(){
        let testOne = dateFormatter!.date(from: "23:59:59")
        let testOneExpectedResult = [cellType.Red,cellType.Red,cellType.Red,cellType.Red]
        let testTwo = dateFormatter!.date(from: "00:00:00")
        let testTwoExpectedResult = [cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank]
        let testThree = dateFormatter!.date(from: "02:04:00")
        let testThreeExpectedResult = [cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank]
        let testFour = dateFormatter!.date(from: "08:23:00")
        let testFourExpectedResult = [cellType.Red,cellType.Blank,cellType.Blank,cellType.Blank]
        let testFive = dateFormatter!.date(from: "16:35:00")
        let testFiveExpectedResult = [cellType.Red,cellType.Red,cellType.Red,cellType.Blank]
        
        let testOneResult = berlinCalendarPresenter.valuesForFiveHoursRow(time: testOne!)
        let testTwoResult = berlinCalendarPresenter.valuesForFiveHoursRow(time: testTwo!)
        let testThreeResult = berlinCalendarPresenter.valuesForFiveHoursRow(time: testThree!)
        let testFourResult = berlinCalendarPresenter.valuesForFiveHoursRow(time: testFour!)
        let testFiveResult = berlinCalendarPresenter.valuesForFiveHoursRow(time: testFive!)
        
        XCTAssertEqual(testOneResult, testOneExpectedResult)
        XCTAssertEqual(testTwoResult, testTwoExpectedResult)
        XCTAssertEqual(testThreeResult, testThreeExpectedResult)
        XCTAssertEqual(testFourResult, testFourExpectedResult)
        XCTAssertEqual(testFiveResult, testFiveExpectedResult)
        XCTAssertNotEqual(testOneResult, testTwoExpectedResult)
    }
    
    func testSecondsBlockResultForGivenTime(){
        let testOne = dateFormatter!.date(from: "00:00:00")
        let testOneExpectedResult = [cellType.Red]
        let testTwo = dateFormatter!.date(from: "23:59:59")
        let testTwoExpectedResult = [cellType.Blank]
        
        let testOneResult = berlinCalendarPresenter.valuesForSecondsRow(time : testOne!)
        let testTwoResult = berlinCalendarPresenter.valuesForSecondsRow(time : testTwo!)
        
        XCTAssertEqual(testOneExpectedResult, testOneResult)
        XCTAssertEqual(testTwoExpectedResult, testTwoResult)
    }

    func testDigitalToBerlinForGivenTime(){
        let testOne = dateFormatter!.date(from: "23:59:59")
        let testOneExpectedResult = [[cellType.Blank],[cellType.Red,cellType.Red,cellType.Red,cellType.Red],[cellType.Red,cellType.Red,cellType.Red,cellType.Blank],[cellType.Yellow,cellType.Yellow,cellType.Red,cellType.Yellow,cellType.Yellow,cellType.Red,cellType.Yellow,cellType.Yellow,cellType.Red,cellType.Yellow,cellType.Yellow],[cellType.Yellow,cellType.Yellow,cellType.Yellow,cellType.Yellow]]
        let testTwo = dateFormatter!.date(from: "00:00:00")
        let testTwoExpectedResult = [[cellType.Red],[cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank],[cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank],[cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank],[cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank]]
        let testThree = dateFormatter!.date(from: "16:50:06")
        let testThreeExpectedResult = [[cellType.Red],[cellType.Red,cellType.Red,cellType.Red,cellType.Blank],[cellType.Red,cellType.Blank,cellType.Blank,cellType.Blank],[cellType.Yellow,cellType.Yellow,cellType.Red,cellType.Yellow,cellType.Yellow,cellType.Red,cellType.Yellow,cellType.Yellow,cellType.Red,cellType.Yellow,cellType.Blank],[cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank]]
        let testFour = dateFormatter!.date(from: "11:37:01")
        let testFourExpectedResult = [[cellType.Blank],[cellType.Red,cellType.Red,cellType.Blank,cellType.Blank],[cellType.Red,cellType.Blank,cellType.Blank,cellType.Blank],[cellType.Yellow,cellType.Yellow,cellType.Red,cellType.Yellow,cellType.Yellow,cellType.Red,cellType.Yellow,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank],[cellType.Yellow,cellType.Yellow,cellType.Blank,cellType.Blank]]
        
        let testOneResult = berlinCalendarPresenter.digitalToBerlin(time: testOne!)
        let testTwoResult = berlinCalendarPresenter.digitalToBerlin(time: testTwo!)
        let testThreeResult = berlinCalendarPresenter.digitalToBerlin(time: testThree!)
        let testFourResult = berlinCalendarPresenter.digitalToBerlin(time: testFour!)
        
        XCTAssertEqual(testOneResult, testOneExpectedResult)
        XCTAssertEqual(testTwoResult, testTwoExpectedResult)
        XCTAssertEqual(testThreeResult, testThreeExpectedResult)
        XCTAssertEqual(testFourResult, testFourExpectedResult)
        XCTAssertNotEqual(testOneResult, testTwoExpectedResult)
    }
    
    func testBerlinToDigital(){
        let testOneExpectedResult = "23:59:01"
        let testOne = [cellType.Blank,cellType.Red,cellType.Red,cellType.Red,cellType.Red,cellType.Red,cellType.Red,cellType.Red,cellType.Blank,cellType.Yellow,cellType.Yellow,cellType.Red,cellType.Yellow,cellType.Yellow,cellType.Red,cellType.Yellow,cellType.Yellow,cellType.Red,cellType.Yellow,cellType.Yellow,cellType.Yellow,cellType.Yellow,cellType.Yellow,cellType.Yellow]
        let testTwoExpectedResult = "00:00:00"
        let testTwo = [cellType.Red,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank]
        let testThreeExpectedResult = "16:50:00"
        let testThree = [cellType.Red,cellType.Red,cellType.Red,cellType.Red,cellType.Blank,cellType.Red,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Yellow,cellType.Yellow,cellType.Red,cellType.Yellow,cellType.Yellow,cellType.Red,cellType.Yellow,cellType.Yellow,cellType.Red,cellType.Yellow,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank]
        let testFourExpectedResult = "11:37:01"
        let testFour = [cellType.Blank,cellType.Red,cellType.Red,cellType.Blank,cellType.Blank,cellType.Red,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Yellow,cellType.Yellow,cellType.Red,cellType.Yellow,cellType.Yellow,cellType.Red,cellType.Yellow,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Blank,cellType.Yellow,cellType.Yellow,cellType.Blank,cellType.Blank]
        
        let testOneResult = berlinCalendarPresenter.berlinToDigital(berlinDataArr : testOne)
        let testTwoResult = berlinCalendarPresenter.berlinToDigital(berlinDataArr : testTwo)
        let testThreeResult = berlinCalendarPresenter.berlinToDigital(berlinDataArr : testThree)
        let testFourResult = berlinCalendarPresenter.berlinToDigital(berlinDataArr : testFour)
        
        XCTAssertEqual(testOneResult, testOneExpectedResult)
        XCTAssertEqual(testTwoResult, testTwoExpectedResult)
        XCTAssertEqual(testThreeResult, testThreeExpectedResult)
        XCTAssertEqual(testFourResult, testFourExpectedResult)
        XCTAssertNotEqual(testOneResult, testTwoExpectedResult)
    }
}
