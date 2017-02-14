
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
(7,29)-(7,41)
(7,48)-(7,57)
(8,21)-(8,24)
*)

(* type error slice
(3,3)-(9,26)
(3,19)-(8,48)
(4,5)-(8,48)
(4,5)-(8,48)
(4,11)-(4,15)
(8,9)-(8,48)
(8,21)-(8,24)
(8,21)-(8,24)
(8,22)-(8,23)
(8,28)-(8,34)
(8,28)-(8,48)
(8,36)-(8,48)
(8,43)-(8,48)
*)
