
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
(7,9)-(9,77)
(7,21)-(7,29)
(7,21)-(7,31)
(7,30)-(7,31)
(8,9)-(9,77)
(8,21)-(8,25)
(9,10)-(9,55)
(9,10)-(9,77)
(9,14)-(9,22)
(9,14)-(9,30)
(9,14)-(9,39)
(9,23)-(9,24)
(9,25)-(9,30)
(9,34)-(9,39)
(9,50)-(9,55)
(10,3)-(10,26)
*)

(* type error slice
(9,10)-(9,55)
(9,10)-(9,55)
(9,10)-(9,55)
(9,10)-(9,77)
(9,45)-(9,55)
*)
