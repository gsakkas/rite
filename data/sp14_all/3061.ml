
let rec append_new xs1 xs2 =
  match xs1 with | [] -> xs2 | head::tail -> head :: (append_new tail xs2);;

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else append_new h seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else [h] @ seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(10,55)-(10,72)
[h] @ seen
AppG (fromList [VarG,ListG (fromList [EmptyG])])

*)

(* type error slice
(3,3)-(3,75)
(3,26)-(3,29)
(3,46)-(3,50)
(3,46)-(3,75)
(3,54)-(3,75)
(3,55)-(3,65)
(3,66)-(3,70)
(3,71)-(3,74)
(10,24)-(10,32)
(10,24)-(10,39)
(10,33)-(10,34)
(10,35)-(10,39)
(10,55)-(10,65)
(10,55)-(10,72)
(10,66)-(10,67)
(10,68)-(10,72)
*)
