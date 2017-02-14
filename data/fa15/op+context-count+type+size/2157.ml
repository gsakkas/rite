
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if not (List.mem seen h) then seen @ [h] else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then seen @ [h] else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,24)-(7,27)
(7,24)-(7,44)
(7,38)-(7,42)
(7,51)-(7,61)
*)

(* type error slice
(7,29)-(7,37)
(7,29)-(7,44)
(7,38)-(7,42)
(7,43)-(7,44)
(7,51)-(7,55)
(7,51)-(7,61)
(7,56)-(7,57)
(7,58)-(7,61)
(7,58)-(7,61)
(7,59)-(7,60)
*)
