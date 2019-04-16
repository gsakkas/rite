
let rec last l =
  match l with | x::[] -> x | hd::tl -> last tl | [] -> failwith "NO ELEMENT";;

let rec listReverse l = match l with | [] -> [] | hd::tl -> (last tl) :: hd;;


(* fix

let rec listReverse l =
  match l with | [] -> [] | hd::tl -> listReverse (hd :: l);;

*)

(* changed spans
(5,61)-(5,76)
listReverse (hd :: l)
AppG (fromList [ConAppG (Just EmptyG)])

*)

(* type error slice
(3,3)-(3,78)
(3,27)-(3,28)
(3,41)-(3,45)
(3,41)-(3,48)
(3,46)-(3,48)
(5,25)-(5,76)
(5,61)-(5,70)
(5,61)-(5,76)
(5,62)-(5,66)
(5,67)-(5,69)
(5,74)-(5,76)
*)
