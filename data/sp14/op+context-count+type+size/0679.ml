
let rec clone x n =
  let accum = [] in if n < 1 then [] else (clone x) :: (accum (n - 1));;


(* fix

let rec clone x n =
  let accum = [] in
  let helper x n = if n < 1 then accum else x :: accum in helper x (n - 1);;

*)

(* changed spans
(3,20)-(3,70)
(3,34)-(3,36)
(3,42)-(3,51)
(3,43)-(3,48)
(3,55)-(3,70)
(3,62)-(3,69)
(3,63)-(3,64)
(3,67)-(3,68)
*)

(* type error slice
(2,3)-(3,72)
(2,14)-(3,70)
(2,16)-(3,70)
(3,2)-(3,70)
(3,2)-(3,70)
(3,14)-(3,16)
(3,20)-(3,70)
(3,42)-(3,51)
(3,42)-(3,70)
(3,42)-(3,70)
(3,43)-(3,48)
(3,55)-(3,70)
(3,56)-(3,61)
*)
