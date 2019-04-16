
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else seen @ h in
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
(7,62)-(7,63)
[h]
ListG (fromList [VarG])

*)

(* type error slice
(7,24)-(7,32)
(7,24)-(7,39)
(7,33)-(7,34)
(7,35)-(7,39)
(7,55)-(7,59)
(7,55)-(7,63)
(7,60)-(7,61)
(7,62)-(7,63)
*)
