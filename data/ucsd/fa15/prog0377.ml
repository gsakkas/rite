
let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  ->
      let quotient = n / 10 in
      let remainder = n mod 10 in
      if quotient = 0
      then [remainder]
      else (digitsOfInt quotient) @ [remainder];;

let _ = digitsOfInt - 1;;
