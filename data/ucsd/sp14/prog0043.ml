
let rec last l = match l with | x::[] -> x | hd::tl -> last tl | [] -> [];;

let rec removeLast l =
  match l with | x::[] -> [] | hd::tl -> hd :: (removeLast tl) | [] -> [];;

let rec listReverse l =
  let x = last l in let y = removeLast l in x :: (listReverse y);;

let _ = listReverse [1; 2; 3; 4];;
