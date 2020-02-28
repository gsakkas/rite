
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem seen h) = false then seen @ [h] else seen in
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
(7,34)-(7,38)
h
VarG

(7,39)-(7,40)
seen
VarG

*)

(* type error slice
(7,24)-(7,41)
(7,25)-(7,33)
(7,34)-(7,38)
(7,39)-(7,40)
(7,55)-(7,59)
(7,55)-(7,65)
(7,60)-(7,61)
(7,62)-(7,65)
(7,63)-(7,64)
*)
