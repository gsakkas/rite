
let rec removeZero l =
  match l with
  | h -> if h != 0 then []
  | h::t -> if h = 0 then removeZero t else h :: (removeZero t);;
