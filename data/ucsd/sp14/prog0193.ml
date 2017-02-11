
let rec digitsOfInt n =
  match n with | [] -> [] | h::t -> [h] :: (digitsOfInt t);;

let _ = digitsOfInt 352663;;
