
let rec listReverse l =
  match l with | [] -> [] | x::l -> x :: (listReverse l x);;
