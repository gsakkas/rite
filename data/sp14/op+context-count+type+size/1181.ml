
let rec sumList xs =
  match xs with | [] -> [] | _ -> (List.hd xs) + (List.tl sumList);;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

*)

(* changed spans
(3,3)-(3,66)
(3,25)-(3,27)
(3,51)-(3,58)
*)

(* type error slice
(3,3)-(3,66)
(3,3)-(3,66)
(3,25)-(3,27)
(3,36)-(3,66)
(3,36)-(3,66)
(3,51)-(3,58)
(3,51)-(3,66)
*)
