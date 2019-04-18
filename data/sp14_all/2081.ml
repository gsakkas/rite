
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen in
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
(7,45)-(7,49)
h :: seen
AppG (fromList [VarG])

(7,49)-(7,49)
seen
VarG

*)

(* type error slice
(7,21)-(7,49)
(7,24)-(7,32)
(7,24)-(7,39)
(7,35)-(7,39)
(7,45)-(7,49)
(7,49)-(7,49)
*)
