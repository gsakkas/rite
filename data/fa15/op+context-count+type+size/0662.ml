
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = List.mem h t in let rest' = t in helper (seen', rest') in
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
(7,20)-(7,32)
(7,31)-(7,32)
(7,36)-(7,74)
(7,48)-(7,49)
(8,12)-(8,18)
(8,19)-(8,26)
(8,20)-(8,22)
(8,24)-(8,25)
*)

(* type error slice
(7,8)-(7,74)
(7,20)-(7,28)
(7,20)-(7,32)
(7,53)-(7,59)
(7,53)-(7,74)
(7,60)-(7,74)
(7,61)-(7,66)
(8,11)-(8,27)
(8,12)-(8,18)
(8,19)-(8,26)
(8,20)-(8,22)
*)
