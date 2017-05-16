
let rec last l =
  match l with | x::[] -> x | hd::tl -> last tl | [] -> failwith "NO ELEMENT";;

let rec listReverse l =
  match l with
  | [] -> []
  | hd::tl -> let x = last l in if x > 0 then x :: x else x :: x;;
