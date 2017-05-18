
let rec listReverse l =
  match l with | [] -> [] | h::t -> let rev = listReverse t in [rev; h];;
