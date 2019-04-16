
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.rev (List.mem h t) then seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  helper ([], l);;


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
(7,24)-(7,47)
List.mem h t
AppG (fromList [VarG])

(9,3)-(9,17)
List.rev (helper ([] , l))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(7,24)-(7,32)
(7,24)-(7,47)
(7,33)-(7,47)
(7,34)-(7,42)
*)
