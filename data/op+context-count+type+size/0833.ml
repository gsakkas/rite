
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | _ ->
        let seen' = if List.mem 0 seen then seen else 0 :: seen in
        let rest' = 0 in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | _ ->
        let seen' = if List.mem 0 seen then seen else 0 :: seen in
        let rest' = [0] in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(8,21)-(8,22)
*)

(* type error slice
(3,3)-(9,26)
(3,19)-(8,46)
(4,5)-(8,46)
(4,11)-(4,15)
(5,13)-(5,17)
(7,9)-(8,46)
(7,21)-(7,64)
(7,24)-(7,32)
(7,24)-(7,39)
(7,33)-(7,34)
(7,35)-(7,39)
(7,45)-(7,49)
(8,9)-(8,46)
(8,21)-(8,22)
(8,26)-(8,32)
(8,26)-(8,46)
(8,34)-(8,39)
(8,34)-(8,46)
(8,41)-(8,46)
*)
