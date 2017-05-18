
let x = [1; 2; 3];;

let rec getLast l =
  match l with | [] -> [] | x::[] -> x | head::tail -> getLast tail;;

let _ = getLast [1; 2; 3];;
