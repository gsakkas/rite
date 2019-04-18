
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then h else t in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,35)-(7,36)
seen
VarG

(7,42)-(7,43)
seen
VarG

(7,49)-(7,50)
h :: seen
AppG (fromList [VarG])

*)

(* type error slice
(4,5)-(8,47)
(7,21)-(7,50)
(7,42)-(7,43)
(7,49)-(7,50)
*)
