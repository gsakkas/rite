
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen @ [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if not (List.mem h seen) then seen @ [h] else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,24)-(7,39)
not (List.mem h seen)
AppG [AppG [EmptyG,EmptyG]]

(7,55)-(7,55)
seen
VarG

*)

(* type error slice
(7,21)-(7,55)
(7,45)-(7,55)
(7,50)-(7,51)
(7,55)-(7,55)
*)
