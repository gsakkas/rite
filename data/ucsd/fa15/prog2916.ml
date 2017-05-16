
let rec listReverse l =
  match l with | [] -> [] | (h::tail)::[] -> listReverse tail;;
