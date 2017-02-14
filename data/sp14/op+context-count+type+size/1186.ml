
let rec sumList xs = match xs with | _ -> (List.hd xs) + 2 | [] -> [];;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

*)

(* changed spans
(2,21)-(2,69)
(2,42)-(2,58)
(2,57)-(2,58)
(2,67)-(2,69)
*)

(* type error slice
(2,21)-(2,69)
(2,21)-(2,69)
(2,42)-(2,58)
(2,67)-(2,69)
*)
