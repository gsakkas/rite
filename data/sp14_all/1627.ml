
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then seen @ [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then [h] @ seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,55)-(7,59)
[h]
ListG [VarG]

(7,62)-(7,65)
seen
VarG

(7,65)-(7,65)
seen
VarG

*)

(* type error slice
(7,21)-(7,65)
(7,55)-(7,65)
(7,60)-(7,61)
(7,65)-(7,65)
*)
