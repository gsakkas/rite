
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h in let rest' = List.mem h l in helper (seen', rest') in
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
(7,21)-(7,22)
(7,26)-(7,74)
(7,49)-(7,50)
(7,54)-(7,74)
(8,13)-(8,19)
(8,21)-(8,23)
(8,21)-(8,26)
(8,25)-(8,26)
*)

(* type error slice
(3,3)-(8,26)
(3,19)-(7,74)
(4,5)-(7,74)
(4,5)-(7,74)
(4,11)-(4,15)
(7,26)-(7,74)
(7,38)-(7,46)
(7,38)-(7,50)
(7,49)-(7,50)
(7,54)-(7,60)
(7,54)-(7,74)
(7,62)-(7,74)
(7,69)-(7,74)
(8,13)-(8,19)
(8,13)-(8,26)
(8,21)-(8,26)
(8,25)-(8,26)
*)
