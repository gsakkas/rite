
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then (seen []) @ [h] in
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
(7,55)-(7,64)
[h]
ListG (fromList [VarG])

(7,67)-(7,70)
seen
VarG

(7,70)-(7,70)
seen
VarG

*)

(* type error slice
(7,21)-(7,70)
(7,24)-(7,41)
(7,25)-(7,33)
(7,36)-(7,40)
(7,55)-(7,64)
(7,55)-(7,70)
(7,56)-(7,60)
(7,65)-(7,66)
(7,70)-(7,70)
*)
