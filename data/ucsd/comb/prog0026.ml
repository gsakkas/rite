
let rec last l =
  match l with | x::[] -> x | hd::tl -> last tl | [] -> failwith "NO ELEMENT";;

let rec listReverse l = match l with | [] -> [] | hd::tl -> (last tl) :: hd;;
