
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
(7,20)-(7,23)
(7,21)-(7,22)
(7,27)-(7,76)
(7,50)-(7,51)
(7,55)-(7,76)
(8,20)-(8,22)
(8,24)-(8,25)
*)

(* type error slice
(3,2)-(8,27)
(3,18)-(7,76)
(4,4)-(7,76)
(4,4)-(7,76)
(4,10)-(4,14)
(7,27)-(7,76)
(7,39)-(7,47)
(7,39)-(7,51)
(7,50)-(7,51)
(7,55)-(7,61)
(7,55)-(7,76)
(7,62)-(7,76)
(7,70)-(7,75)
(8,11)-(8,27)
(8,12)-(8,18)
(8,19)-(8,26)
(8,24)-(8,25)
*)
