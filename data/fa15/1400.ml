
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem (h, t) then [] else [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then [] else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,24)-(7,39)
List.mem h seen
AppG [VarG,VarG]

(7,53)-(7,56)
h :: seen
AppG [VarG,VarG]

*)

(* type error slice
(7,21)-(7,56)
(7,24)-(7,32)
(7,24)-(7,39)
*)
