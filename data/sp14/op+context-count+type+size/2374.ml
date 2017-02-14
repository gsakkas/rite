
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        if not (List.mem seen h)
        then let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t -> let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,8)-(8,76)
(7,11)-(7,14)
(7,11)-(7,32)
(7,15)-(7,32)
(7,16)-(7,24)
(7,25)-(7,29)
(7,30)-(7,31)
(8,13)-(8,76)
(8,38)-(8,76)
*)

(* type error slice
(7,15)-(7,32)
(7,16)-(7,24)
(7,25)-(7,29)
(7,30)-(7,31)
(8,25)-(8,26)
(8,25)-(8,34)
(8,25)-(8,34)
(8,30)-(8,34)
*)
