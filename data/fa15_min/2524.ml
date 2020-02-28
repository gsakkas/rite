
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then [seen] else [seen] @ h in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else seen @ [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,45)-(7,51)
seen
VarG

(7,57)-(7,63)
seen
VarG

(7,66)-(7,67)
[h]
ListG [VarG]

*)

(* type error slice
(7,21)-(7,67)
(7,24)-(7,32)
(7,24)-(7,39)
(7,33)-(7,34)
(7,35)-(7,39)
(7,45)-(7,51)
(7,46)-(7,50)
(7,57)-(7,63)
(7,57)-(7,67)
(7,58)-(7,62)
(7,64)-(7,65)
(7,66)-(7,67)
*)
