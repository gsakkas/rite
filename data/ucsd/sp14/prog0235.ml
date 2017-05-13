
let z = 0;;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    if z = true
    then (let n2 = reverse (string_of_int n)
          and z = false in digitsOfInt n2)
    else
      (let x = n / 10
       and y = n mod 10 in
       if (x = 0) && (y = 0) then [] else y :: (digitsOfInt x));;
