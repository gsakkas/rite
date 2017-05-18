
let rec listReverse l =
  match l with | [] -> [] | a::b -> b :: (listReverse a);;
