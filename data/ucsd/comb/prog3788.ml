
let rec digitsOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> [n]
       | true  -> (digitsOfInt (n / 10)) :: (digitsOfInt (n mod 10)));;
