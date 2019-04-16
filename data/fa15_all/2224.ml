
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if not (List.mem h t) then seen :: h else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if not (List.mem h seen) then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,40)-(7,41)
seen
VarG

(7,48)-(7,52)
h
VarG

(7,56)-(7,57)
seen
VarG

*)

(* type error slice
(7,21)-(7,67)
(7,48)-(7,52)
(7,48)-(7,57)
(7,63)-(7,67)
*)
