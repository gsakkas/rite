
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then [h] @ seen in
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
(7,55)-(7,58)
seen
VarG

(7,61)-(7,65)
[h]
ListG (fromList [VarG])

(7,65)-(7,65)
seen
VarG

*)

(* type error slice
(7,21)-(7,65)
(7,55)-(7,65)
(7,59)-(7,60)
(7,65)-(7,65)
*)
