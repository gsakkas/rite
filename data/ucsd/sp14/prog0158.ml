
let num_of_digits xs =
  let y = log10 (float_of_int xs) in (int_of_float y) + 1;;

let digitsOfInt n =
  let rec digits x l =
    let numdig = num_of_digits x in
    if numdig > 1
    then ((x / (((float_of_int 10) ** numdig) - 1)) mod 10) :: l
    else numdig :: 1 in
  digits n [];;
