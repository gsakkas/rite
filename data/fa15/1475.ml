
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = List.mem seen h in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h seen then seen else seen @ [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,20)-(7,35)
(7,29)-(7,33)
(7,34)-(7,35)
*)

(* type error slice
(7,8)-(7,77)
(7,20)-(7,28)
(7,20)-(7,35)
(7,56)-(7,62)
(7,56)-(7,77)
(7,63)-(7,77)
(7,64)-(7,69)
(8,11)-(8,27)
(8,12)-(8,18)
(8,19)-(8,26)
(8,20)-(8,22)
*)

(* all spans
(2,21)-(8,27)
(3,2)-(8,27)
(3,18)-(7,77)
(4,4)-(7,77)
(4,10)-(4,14)
(5,12)-(5,16)
(7,8)-(7,77)
(7,20)-(7,35)
(7,20)-(7,28)
(7,29)-(7,33)
(7,34)-(7,35)
(7,39)-(7,77)
(7,51)-(7,52)
(7,56)-(7,77)
(7,56)-(7,62)
(7,63)-(7,77)
(7,64)-(7,69)
(7,71)-(7,76)
(8,2)-(8,27)
(8,2)-(8,10)
(8,11)-(8,27)
(8,12)-(8,18)
(8,19)-(8,26)
(8,20)-(8,22)
(8,24)-(8,25)
*)
