
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then h in
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
(7,21)-(7,43)
(7,35)-(7,36)
(7,42)-(7,43)
*)

(* type error slice
(7,9)-(8,46)
(7,21)-(7,43)
(7,21)-(7,43)
(8,26)-(8,32)
(8,26)-(8,46)
(8,34)-(8,39)
(8,34)-(8,46)
(9,13)-(9,19)
(9,13)-(9,26)
(9,21)-(9,23)
(9,21)-(9,26)
*)
