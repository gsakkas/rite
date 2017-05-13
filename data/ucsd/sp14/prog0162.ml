
let num_of_digits xs =
  let y = log10 (float_of_int xs) in (int_of_float y) + 1;;

let digitsOfInt n =
  let rec digits x l =
    let numdig = num_of_digits x in
    if numdig > 1
    then
      match l with
      | hd::tl ->
          ((x /
              (int_of_float
                 ((float_of_int 10) ** (float_of_int (numdig - 1)))))
             mod 10)
          :: (digits (x / 10) tl)
    else numdig :: l in
  digits n [];;

let digitsOfInt n =
  if n < 10
  then [n]
  else
    [(digitsOfInt n) / 10;
    (n / (int_of_float ((float_of_int 10) ** (float_of_int (numdig - 1)))))
      mod 10];;
