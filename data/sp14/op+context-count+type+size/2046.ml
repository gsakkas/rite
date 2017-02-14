
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem t then h in
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
(7,21)-(7,41)
(7,24)-(7,34)
(7,33)-(7,34)
(8,9)-(8,46)
(9,21)-(9,23)
(9,25)-(9,26)
*)

(* type error slice
(7,9)-(8,46)
(7,21)-(7,41)
(7,21)-(7,41)
(7,21)-(7,41)
(7,24)-(7,32)
(7,24)-(7,34)
(8,26)-(8,32)
(8,26)-(8,46)
(8,34)-(8,39)
(8,34)-(8,46)
(9,13)-(9,19)
(9,13)-(9,26)
(9,21)-(9,23)
(9,21)-(9,26)
*)
