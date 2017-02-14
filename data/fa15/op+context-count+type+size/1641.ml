
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let rest' = List.rev t in
        let seen' = seen in
        (if (List.mem h rest') = false then h :: seen'; helper (seen', rest')) in
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
(7,8)-(9,78)
(7,20)-(7,28)
(7,20)-(7,30)
(7,29)-(7,30)
(8,8)-(9,78)
(8,20)-(8,24)
(9,8)-(9,78)
(9,9)-(9,54)
(9,12)-(9,30)
(9,12)-(9,38)
(9,13)-(9,21)
(9,22)-(9,23)
(9,24)-(9,29)
(9,33)-(9,38)
(9,49)-(9,54)
(10,2)-(10,27)
*)

(* type error slice
(9,8)-(9,78)
(9,9)-(9,54)
(9,9)-(9,54)
(9,9)-(9,54)
(9,44)-(9,54)
*)
