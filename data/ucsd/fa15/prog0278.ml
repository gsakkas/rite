
let rec digitsOfIntHelper (num,numList) =
  if num < 10
  then num :: numList
  else digitsOfIntHelper ((num / 10), ((num mod 10) :: numList));;

let rec digitsOfInt n = if n < 0 then [] else digitsOfIntHelper (n, []);;

let _ = digitsOfInt - 299394;;
