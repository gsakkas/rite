
let rec sumList xs =
  match xs with | _ -> (List.hd xs) + (sumList List.tl) | [] -> [];;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

*)

(* changed spans
(3,3)-(3,67)
(3,25)-(3,55)
(3,48)-(3,55)
(3,65)-(3,67)
*)

(* type error slice
(2,4)-(3,69)
(2,17)-(3,67)
(3,3)-(3,67)
(3,3)-(3,67)
(3,25)-(3,32)
(3,25)-(3,35)
(3,25)-(3,55)
(3,33)-(3,35)
(3,40)-(3,47)
(3,40)-(3,55)
(3,48)-(3,55)
(3,65)-(3,67)
*)
