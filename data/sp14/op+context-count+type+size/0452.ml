
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
(6,14)-(6,77)
(6,26)-(6,30)
(6,34)-(6,35)
(6,39)-(6,77)
(6,51)-(6,52)
(6,56)-(6,77)
*)

(* type error slice
(3,2)-(7,27)
(3,18)-(6,77)
(6,14)-(6,77)
(6,26)-(6,30)
(6,26)-(6,35)
(6,26)-(6,35)
(6,56)-(6,62)
(6,56)-(6,77)
(6,63)-(6,77)
(6,64)-(6,69)
*)
