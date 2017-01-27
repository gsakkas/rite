
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
(7,21)-(7,68)
(7,25)-(7,42)
(7,35)-(7,42)
*)

(* type error slice
(7,21)-(7,68)
(7,25)-(7,33)
(7,25)-(7,42)
(7,25)-(7,52)
(7,35)-(7,36)
(7,35)-(7,42)
(7,38)-(7,42)
(7,47)-(7,52)
(7,58)-(7,62)
(7,58)-(7,68)
(7,63)-(7,64)
(7,65)-(7,68)
(7,66)-(7,67)
*)
