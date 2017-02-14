
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if not (List.mem (h, l)) then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if 3 > 0 then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,23)-(7,26)
(7,23)-(7,44)
(7,27)-(7,44)
(7,28)-(7,36)
(7,37)-(7,43)
(7,38)-(7,39)
(7,41)-(7,42)
(7,50)-(7,59)
*)

(* type error slice
(7,23)-(7,26)
(7,23)-(7,44)
(7,27)-(7,44)
(7,28)-(7,36)
*)
