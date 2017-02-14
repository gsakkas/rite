
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
(9,9)-(9,18)
(9,19)-(9,22)
*)

(* type error slice
(5,4)-(8,73)
(5,4)-(8,73)
(8,54)-(8,60)
(8,54)-(8,72)
(8,61)-(8,62)
(9,2)-(9,8)
(9,2)-(9,22)
(9,9)-(9,18)
*)
