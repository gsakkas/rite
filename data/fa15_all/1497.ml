
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem seen h then seen else h @ seen in
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
(7,33)-(7,37)
h
VarG

(7,38)-(7,39)
seen
VarG

(7,55)-(7,56)
seen
VarG

(7,59)-(7,63)
[h]
ListG (fromList [VarG])

*)

(* type error slice
(7,24)-(7,32)
(7,24)-(7,39)
(7,33)-(7,37)
(7,38)-(7,39)
(7,55)-(7,56)
(7,55)-(7,63)
(7,57)-(7,58)
(7,59)-(7,63)
*)
