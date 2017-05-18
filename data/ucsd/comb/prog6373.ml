
let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  ->
      let remainder = n mod 10 in
      if n = 0 then [remainder] else ((digitsOfInt n) / 10) @ [remainder];;
