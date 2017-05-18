
let rec listReverse l =
  match l with | [] -> [] | t -> t | h::t -> h @ (listReverse t);;
