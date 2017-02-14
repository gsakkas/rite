
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
(7,8)-(9,70)
(7,20)-(7,28)
(7,20)-(7,30)
(7,29)-(7,30)
(8,8)-(9,70)
(8,20)-(8,24)
(9,8)-(9,70)
(9,11)-(9,29)
(9,11)-(9,37)
(9,12)-(9,20)
(9,21)-(9,22)
(9,23)-(9,28)
(9,32)-(9,37)
(9,43)-(9,48)
(9,43)-(9,70)
(9,49)-(9,55)
*)

(* type error slice
(4,4)-(9,70)
(4,4)-(9,70)
(5,12)-(5,16)
(7,8)-(9,70)
(8,8)-(9,70)
(8,8)-(9,70)
(8,20)-(8,24)
(9,8)-(9,70)
(9,8)-(9,70)
(9,43)-(9,48)
(9,43)-(9,70)
(9,56)-(9,70)
(9,57)-(9,62)
*)
