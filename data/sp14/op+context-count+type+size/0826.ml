
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = [h] in let rest' = List.mem h l in helper (seen', rest') in
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
(7,21)-(7,24)
(7,22)-(7,23)
(7,28)-(7,76)
(7,51)-(7,52)
(7,56)-(7,76)
(8,21)-(8,23)
(8,25)-(8,26)
*)

(* type error slice
(3,3)-(8,26)
(3,19)-(7,76)
(4,5)-(7,76)
(4,5)-(7,76)
(4,11)-(4,15)
(7,28)-(7,76)
(7,40)-(7,48)
(7,40)-(7,52)
(7,51)-(7,52)
(7,56)-(7,62)
(7,56)-(7,76)
(7,64)-(7,76)
(7,71)-(7,76)
(8,13)-(8,19)
(8,13)-(8,26)
(8,21)-(8,26)
(8,25)-(8,26)
*)
