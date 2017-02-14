
let rec clone x n =
  let accum = [] in if n < 1 then [] else clone (x :: accum) (n - 1);;


(* fix

let rec clone x n =
  let accum = [] in
  let helper x n = if n < 1 then accum else x :: accum in helper x (n - 1);;

*)

(* changed spans
(3,20)-(3,68)
(3,34)-(3,36)
(3,42)-(3,47)
(3,42)-(3,68)
(3,61)-(3,68)
(3,62)-(3,63)
(3,66)-(3,67)
*)

(* type error slice
(2,3)-(3,70)
(2,14)-(3,68)
(3,42)-(3,47)
(3,42)-(3,68)
(3,48)-(3,60)
(3,48)-(3,60)
(3,49)-(3,50)
*)
