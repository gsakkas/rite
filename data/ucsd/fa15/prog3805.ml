
let _ =
  let rec digitsOfIntHelper (num,numList) =
    if num < 10
    then num :: numList
    else digitsOfIntHelper (num / 10) ((num mod 10) :: numList) in
  digitsOfIntHelper (num, []);;
