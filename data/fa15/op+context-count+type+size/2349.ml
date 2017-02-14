
let rec sumList xs = if (List.length xs) > 0 then (List.hd xs) + (sumList xs);;


(* fix

let rec sumList xs = if xs = [] then 0 else (List.hd xs) + (sumList xs);;

*)

(* changed spans
(2,22)-(2,77)
(2,26)-(2,37)
(2,26)-(2,40)
(2,26)-(2,45)
(2,44)-(2,45)
*)

(* type error slice
(2,22)-(2,77)
(2,22)-(2,77)
(2,22)-(2,77)
(2,52)-(2,77)
*)
