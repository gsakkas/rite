
let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  ->
      let q = n / 10 in
      let r = n mod 10 in if q = 0 then r else (digitsOfInt q) @ [r];;
