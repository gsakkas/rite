
let rec listReverse l =
  match l with | [] -> [] | a::[] -> [a] | a::b::[] -> b :: (listReverse a);;
