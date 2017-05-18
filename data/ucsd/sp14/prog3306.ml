
let x x = x;;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else x :: xs;;

let _ = removeZero [0; 0; 0; 0] int_of_list [9; 9];;
