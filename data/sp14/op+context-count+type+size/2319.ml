
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem (h, seen)) = false then seen @ [h] in
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
(7,20)-(7,67)
(7,23)-(7,43)
(7,33)-(7,42)
*)

(* type error slice
(7,20)-(7,67)
(7,20)-(7,67)
(7,20)-(7,67)
(7,23)-(7,43)
(7,23)-(7,51)
(7,23)-(7,51)
(7,24)-(7,32)
(7,46)-(7,51)
(7,57)-(7,67)
(7,62)-(7,63)
*)
