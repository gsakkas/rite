
let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t;;
