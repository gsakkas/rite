
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then [] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,35)-(7,36)
seen
VarG

(7,42)-(7,44)
h :: seen
AppG [VarG,VarG]

(7,44)-(7,44)
seen
VarG

*)

(* type error slice
(7,21)-(7,44)
(7,42)-(7,44)
(7,44)-(7,44)
*)
