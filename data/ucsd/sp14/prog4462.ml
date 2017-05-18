
let rec myFunc f a b =
  match b with | [] -> a | h::t -> (a h) + (myFunc f h t);;
