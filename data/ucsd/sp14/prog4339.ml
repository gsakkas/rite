
let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t;;
