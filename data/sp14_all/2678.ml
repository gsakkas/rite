
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem (h t) then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,24)-(7,38)
List.mem h t
AppG [VarG,VarG]

*)

(* type error slice
(4,5)-(8,47)
(7,21)-(7,63)
(7,24)-(7,32)
(7,24)-(7,38)
(7,33)-(7,38)
(7,34)-(7,35)
(7,36)-(7,37)
*)
