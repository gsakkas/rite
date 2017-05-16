
let rec listReverse l =
  match l with | [] -> [] | hd::l' -> 1 + (listReverse l);;
