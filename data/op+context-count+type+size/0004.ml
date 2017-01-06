
let rec listReverse l =
  match l with | [] -> [] | hd::tl -> [listReverse tl; hd];;



let rec listReverse l =
  match l with | [] -> [] | hd::tl -> (listReverse tl) @ [hd];;


(* changed spans
(3,39)-(3,40)
(3,54)-(3,55)
*)

(* type error slice
(3,40)-(3,54)
*)
