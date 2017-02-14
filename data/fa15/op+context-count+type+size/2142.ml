
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if not (List.mem = h) then h :: seen else seen in
        let rest' = [t] in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if not (List.mem h seen) then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,27)-(7,41)
(7,47)-(7,56)
(8,20)-(8,23)
*)

(* type error slice
(3,2)-(9,27)
(3,18)-(8,48)
(4,4)-(8,48)
(4,4)-(8,48)
(4,10)-(4,14)
(8,8)-(8,48)
(8,20)-(8,23)
(8,20)-(8,23)
(8,21)-(8,22)
(8,27)-(8,33)
(8,27)-(8,48)
(8,34)-(8,48)
(8,42)-(8,47)
*)
