
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem (h, seen) then [] else seen @ h in
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
(7,24)-(7,42)
List.mem h seen
AppG (fromList [VarG])

(7,48)-(7,50)
seen
VarG

(7,63)-(7,64)
[h]
ListG (fromList [VarG])

*)

(* type error slice
(7,21)-(7,64)
(7,24)-(7,32)
(7,24)-(7,42)
*)
