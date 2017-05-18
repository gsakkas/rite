
let rec listReverse l =
  match l with | [] -> [] | x::xs -> (listReverse xs) @ x;;

let _ = listReverse ["a"; "b"; "c"; "d"];;
