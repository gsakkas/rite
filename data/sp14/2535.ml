
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t -> let seen' = seen :: h in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | hd::tl ->
        let seen' = hd :: seen in let rest' = tl in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(4,4)-(6,77)
(6,26)-(6,30)
(6,34)-(6,35)
(6,51)-(6,52)
*)

(* type error slice
(3,2)-(7,27)
(3,18)-(6,77)
(6,14)-(6,77)
(6,26)-(6,30)
(6,26)-(6,35)
(6,56)-(6,62)
(6,56)-(6,77)
(6,63)-(6,77)
(6,64)-(6,69)
*)

(* all spans
(2,21)-(7,27)
(3,2)-(7,27)
(3,18)-(6,77)
(4,4)-(6,77)
(4,10)-(4,14)
(5,12)-(5,16)
(6,14)-(6,77)
(6,26)-(6,35)
(6,26)-(6,30)
(6,34)-(6,35)
(6,39)-(6,77)
(6,51)-(6,52)
(6,56)-(6,77)
(6,56)-(6,62)
(6,63)-(6,77)
(6,64)-(6,69)
(6,71)-(6,76)
(7,2)-(7,27)
(7,2)-(7,10)
(7,11)-(7,27)
(7,12)-(7,18)
(7,19)-(7,26)
(7,20)-(7,22)
(7,24)-(7,25)
*)
