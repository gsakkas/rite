
let rec digitsOfInt n =
  let rec digitsOfIntHelper n result =
    if n > 0
    then (digitsOfIntHelper (n / 10) (n mod 10)) :: result
    else result in
  digitsOfIntHelper n [];;
