
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem (h t) then true else false in
        let rest' = failwith "to be written" in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then [] :: seen else h :: seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,24)-(7,37)
(7,34)-(7,37)
(7,44)-(7,48)
(7,54)-(7,59)
(8,9)-(8,69)
(8,21)-(8,29)
(8,21)-(8,45)
(8,30)-(8,45)
*)

(* type error slice
(4,5)-(8,69)
(4,5)-(8,69)
(7,9)-(8,69)
(7,21)-(7,59)
(7,21)-(7,59)
(7,24)-(7,32)
(7,24)-(7,37)
(7,34)-(7,35)
(7,34)-(7,37)
(7,36)-(7,37)
(7,44)-(7,48)
(8,49)-(8,55)
(8,49)-(8,69)
(8,57)-(8,62)
(8,57)-(8,69)
(9,13)-(9,19)
(9,13)-(9,26)
(9,21)-(9,23)
(9,21)-(9,26)
*)
