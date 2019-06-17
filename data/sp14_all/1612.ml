
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
(7,24)-(7,44)
List.mem h seen
AppG [VarG,VarG]

(7,68)-(7,68)
seen
VarG

*)

(* type error slice
(7,21)-(7,68)
(7,24)-(7,44)
(7,24)-(7,52)
(7,25)-(7,33)
(7,47)-(7,52)
(7,58)-(7,68)
(7,63)-(7,64)
(7,68)-(7,68)
*)
