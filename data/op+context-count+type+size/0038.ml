
let rec assoc (d,k,l) =
  let temp = l in
  let rec helper acc (d,k,l) =
    match temp with
    | [] -> d
    | h::t ->
        (match h with | (s,v) -> if s = k then v else helper (d, k, l) t) in
  helper (d, k, l) acc;;



let rec assoc (d,k,l) =
  let acc = l in
  let rec helper acc (d,k,l) =
    match acc with
    | [] -> d
    | h::t ->
        (match h with | (s,v) -> if s = k then v else helper t (d, k, l)) in
  helper acc (d, k, l);;


(* changed spans
(3,7)-(3,11)
(5,11)-(5,15)
(8,72)-(8,73)
(9,20)-(9,23)
*)

(* type error slice
*)
