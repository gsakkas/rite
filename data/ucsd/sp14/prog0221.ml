
let x = [1; 2; 3];;

let rec getLast l =
  match l with | [] -> [] | x::[] -> x | head::tail -> getLast tail;;

let x = [1; 2; 3];;

let _ = getLast x;;
