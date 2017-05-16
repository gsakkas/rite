
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> (listReverse tl) @ hd;;

let _ = listReverse ["a"; "b"; "c"; "d"];;
