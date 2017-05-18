
let rec listReverse l =
  match l with | [] -> [] | head::tail -> (listReverse tail) @ head;;

let _ = listReverse ["a"; "b"; "c"; "d"];;
