
let isP x = x > 0;;

let rec digitsOfInt n =
  match n with
  | [] -> []
  | h::t -> let rest = digitsOfInt t in if isP h then h :: rest else rest;;

let digits n = digitsOfInt (abs n);;
