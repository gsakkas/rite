
let rec sumList xs = match xs with | [] -> [] | _ -> (List.hd xs) + 2;;


(* fix

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

*)

(* changed spans
(2,22)-(2,70)
(2,44)-(2,46)
(2,69)-(2,70)
*)

(* type error slice
(2,22)-(2,70)
(2,44)-(2,46)
(2,55)-(2,70)
*)
