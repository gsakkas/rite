
let rec assoc (d,k,l) =
  let acc = l in
  let rec helper acc (d,k,l) =
    match acc with
    | [] -> d
    | h::t ->
        (match h with | (s,v) -> if s = k then v else helper t (d, k, l)) in
  helper (d, k, l) acc;;


(* fix

let rec assoc (d,k,l) =
  let acc = l in
  let rec helper acc (d,k,l) =
    match acc with
    | [] -> d
    | h::t ->
        (match h with | (s,v) -> if s = k then v else helper t (d, k, l)) in
  helper acc (d, k, l);;

*)

(* changed spans
(9,11)-(9,18)
(9,20)-(9,23)
*)

(* type error slice
(3,3)-(9,23)
(3,13)-(3,14)
(5,5)-(8,72)
(8,55)-(8,61)
(8,55)-(8,72)
(8,62)-(8,63)
(8,65)-(8,66)
(8,65)-(8,72)
(8,68)-(8,69)
(8,71)-(8,72)
(9,3)-(9,9)
(9,3)-(9,23)
(9,11)-(9,12)
(9,11)-(9,18)
(9,14)-(9,15)
(9,17)-(9,18)
(9,20)-(9,23)
*)
