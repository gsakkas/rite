
let rec last l =
  match l with | x::[] -> x | hd::tl -> last tl | [] -> failwith "error";;

let rec removeLast l =
  match l with | x::[] -> [] | hd::tl -> hd :: (removeLast tl) | [] -> [];;

let rec listReverse l =
  let x = last l in
  let y = removeLast l in if y = [] then x :: y else x :: (listReverse y);;

let rec reversed n = if n <= 0 then [] else (n mod 10) :: (reversed (n / 10));;

let rec digitsOfInt n = listReverse reversed n;;
