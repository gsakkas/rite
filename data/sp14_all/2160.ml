
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if !(List.mem h seen) then h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then h :: seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,24)-(7,42)
List.mem h seen
AppG [VarG,VarG]

(7,57)-(7,57)
h :: seen
AppG [VarG,VarG]

*)

(* type error slice
(7,21)-(7,57)
(7,24)-(7,25)
(7,24)-(7,42)
(7,25)-(7,42)
(7,26)-(7,34)
(7,48)-(7,57)
(7,57)-(7,57)
*)
