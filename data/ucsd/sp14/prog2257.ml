
let rec helperDigits (num,newList) =
  if num < 10
  then num :: newList
  else ((num / 10), ((num mod 10) :: newList));;
