
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let rest' = List.rev t in
        let seen' = seen in
        if (List.mem h rest') = false then seen' helper (seen', rest') in
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
(7,9)-(9,70)
(7,21)-(7,29)
(7,21)-(7,31)
(7,30)-(7,31)
(8,9)-(9,70)
(8,21)-(8,25)
(9,9)-(9,70)
(9,13)-(9,21)
(9,13)-(9,29)
(9,13)-(9,38)
(9,22)-(9,23)
(9,24)-(9,29)
(9,33)-(9,38)
(9,44)-(9,49)
(9,44)-(9,70)
(9,50)-(9,56)
*)

(* type error slice
(4,5)-(9,70)
(4,5)-(9,70)
(5,13)-(5,17)
(7,9)-(9,70)
(8,9)-(9,70)
(8,9)-(9,70)
(8,21)-(8,25)
(9,9)-(9,70)
(9,9)-(9,70)
(9,44)-(9,49)
(9,44)-(9,70)
(9,58)-(9,63)
(9,58)-(9,70)
*)
