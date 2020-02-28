
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t -> let seen' = seen :: h in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t -> let seen' = seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(6,27)-(6,36)
seen
VarG

*)

(* type error slice
(3,3)-(7,28)
(3,19)-(6,78)
(6,15)-(6,78)
(6,27)-(6,31)
(6,27)-(6,36)
(6,57)-(6,63)
(6,57)-(6,78)
(6,64)-(6,78)
(6,65)-(6,70)
*)
