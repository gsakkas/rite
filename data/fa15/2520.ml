
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem (h seen) then [] else seen @ h in
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
(7,24)-(7,41)
List.mem h seen
AppG [VarG,VarG]

(7,47)-(7,49)
seen
VarG

(7,62)-(7,63)
[h]
ListG [VarG]

*)

(* type error slice
(7,21)-(7,63)
(7,24)-(7,32)
(7,24)-(7,41)
(7,33)-(7,41)
(7,34)-(7,35)
(7,55)-(7,63)
(7,60)-(7,61)
(7,62)-(7,63)
*)
