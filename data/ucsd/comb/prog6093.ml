
let rec listReverse l =
  match l with | [] -> [] | h::tl -> (listReverse l) @ h;;

let _ = listReverse ["a"; "b"; "c"; "d"];;
