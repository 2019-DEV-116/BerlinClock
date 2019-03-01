# BerlinClock

      IOS Application to deal with ciphering the digital to berlin clock and vice versa
      
      
## Methods helps Cipher Digital Time to Berlin Time 

Methods available in this class `BerlinCalendarPresenter`

`valuesForSingleMinutesRow(time : Date) -> [BerlinClockUICellType]`

`valuesForFiveMinutesRow(time : Date) -> [BerlinClockUICellType]`

`valuesForSingleHoursRow(time : Date) -> [BerlinClockUICellType]`

`valuesForFiveHoursRow(time : Date) -> [BerlinClockUICellType]`

`valuesForSecondsRow(time : Date) -> [BerlinClockUICellType]`

`BerlinClockUICellType` Denotes the type of cell which already defined in three colors in requirement RED,ORANGE and BLANK.Helps to categorize and as part of ui designing dynamically

`digitalToBerlin(time: Date) -> [[BerlinClockUICellType]]` -> Returns Array Of Array.
      0 -> Seconds Array contains 1 cells
      1 -> 5 Hours Array contains 4 cells
      2 -> 1 Hour Array contains 4 cells
      3 -> 5 Minutes Array contains 11 cells
      4 -> 1 Minutes Array contains 4 cells

## Methods helps Decipher Berlin Time To Digital Time 
 
`berlinToDigital(berlinDataArr: [BerlinClockUICellType]) -> String` -> gets the array of BerlinClockUICellType and Returns the digital time

## Tools Used

``Swift``
``MVP Pattern``
