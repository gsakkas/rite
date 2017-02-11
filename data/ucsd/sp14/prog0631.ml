
let rec digOfIntHelper h = match h > 0 with | true  -> 1 | false  -> 0;;

let rec digitsOfInt n =
  match n with
  | 0 -> []
  | 0::[] -> []
  | 1 -> []
  | true  -> [digOfIntHelper n; []; n mod 10]
  | false  -> [];;
