
let rec sumList xs =
  match xs with | [] -> [] | _ -> (List.hd xs) + (sumList List.tl);;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

*)

(* changed spans
(3,3)-(3,66)
(3,25)-(3,27)
(3,59)-(3,66)
*)

(* type error slice
(2,4)-(3,69)
(2,17)-(3,66)
(3,3)-(3,66)
(3,3)-(3,66)
(3,25)-(3,27)
(3,36)-(3,43)
(3,36)-(3,46)
(3,36)-(3,66)
(3,44)-(3,46)
(3,51)-(3,58)
(3,51)-(3,66)
(3,59)-(3,66)
*)
