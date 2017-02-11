
let rec helperDigits (num,newList) =
  if num < 10
  then num :: newList
  else helperDigits ((num / 10), ((num mod 10) :: newList));;

let rec digitsOfInt n = if n < 0 then [] else helperDigits (n, []);;

let _ = digitsOfInt - 1;;
