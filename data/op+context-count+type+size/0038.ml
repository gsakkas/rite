
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
(5,5)-(8,72)
(5,5)-(8,72)
(8,55)-(8,61)
(8,55)-(8,72)
(8,62)-(8,63)
(9,3)-(9,9)
(9,3)-(9,23)
(9,11)-(9,18)
*)
