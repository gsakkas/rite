
let x = [1; 2; 3];;

let rec listReverse l =
  match l with | [] -> [] | x::[] -> [x] | head::tail::third -> head :: tail;;
