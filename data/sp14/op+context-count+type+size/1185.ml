
let rec sumList xs =
  match xs with | [] -> [] | _ -> (List.hd xs) + (sumList List.tl);;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

*)

(* changed spans
(3,2)-(3,66)
(3,24)-(3,26)
(3,58)-(3,65)
*)

(* type error slice
(2,3)-(3,68)
(2,16)-(3,66)
(3,2)-(3,66)
(3,2)-(3,66)
(3,24)-(3,26)
(3,34)-(3,46)
(3,34)-(3,66)
(3,35)-(3,42)
(3,43)-(3,45)
(3,49)-(3,66)
(3,50)-(3,57)
(3,58)-(3,65)
*)
