
let rec listReverse l =
  match l with | [] -> [] | h -> h | h::t -> h @ (listReverse t);;
