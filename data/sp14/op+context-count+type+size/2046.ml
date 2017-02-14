
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
(7,20)-(7,40)
(7,23)-(7,33)
(7,32)-(7,33)
(8,8)-(8,46)
(9,20)-(9,22)
(9,24)-(9,25)
*)

(* type error slice
(7,8)-(8,46)
(7,20)-(7,40)
(7,20)-(7,40)
(7,20)-(7,40)
(7,23)-(7,31)
(7,23)-(7,33)
(8,25)-(8,31)
(8,25)-(8,46)
(8,32)-(8,46)
(8,33)-(8,38)
(9,11)-(9,27)
(9,12)-(9,18)
(9,19)-(9,26)
(9,20)-(9,22)
*)
