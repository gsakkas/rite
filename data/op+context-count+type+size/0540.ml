
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t -> let seen' = seen :: h in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;



let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | hd::tl ->
        let seen' = hd :: seen in let rest' = tl in helper (seen', rest') in
  List.rev (helper ([], l));;


(* changed spans
(6,7)-(6,8)
(6,10)-(6,11)
(6,27)-(6,31)
(6,35)-(6,36)
(6,52)-(6,53)
*)

(* type error slice
(3,3)-(7,26)
(6,57)-(6,77)
*)
