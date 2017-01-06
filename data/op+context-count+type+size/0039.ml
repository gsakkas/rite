
let rec assoc (d,k,l) =
  let acc = l in
  let rec helper acc (d,k,l) =
    match acc with
    | [] -> d
    | h::t ->
        (match h with | (s,v) -> if s = k then v else helper t (d, k, l)) in
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
(9,20)-(9,23)
*)

(* type error slice
(8,55)-(8,72)
(9,3)-(9,23)
*)
