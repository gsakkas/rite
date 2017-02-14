
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
(4,5)-(6,77)
(6,15)-(6,77)
(6,27)-(6,31)
(6,35)-(6,36)
(6,40)-(6,77)
(6,52)-(6,53)
(6,57)-(6,77)
*)

(* type error slice
(3,3)-(7,26)
(3,19)-(6,77)
(6,15)-(6,77)
(6,27)-(6,31)
(6,27)-(6,36)
(6,27)-(6,36)
(6,57)-(6,63)
(6,57)-(6,77)
(6,65)-(6,70)
(6,65)-(6,77)
*)
