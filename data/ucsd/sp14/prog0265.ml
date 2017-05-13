
let rec last l =
  match l with
  | x::[] -> x
  | hd::tl -> (last tl) :: hd
  | [] -> failwith "NO ELEMENT";;
