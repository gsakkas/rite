
let is10gte n = n >= 10;;

let rec digitalRoot n =
  if is10gte
  then
    let digitList = digitsOfInt n in
    let digitSum = sumList digitList in digitalRoot n
  else n;;
