
let rec removeZero l = match l with | [] -> [] | hd::t -> (removeZero l) @ hd;;

let _ = removeZero [9; 9];;
