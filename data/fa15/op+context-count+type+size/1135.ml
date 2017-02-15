
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then true else false in
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
(7,41)-(7,45)
(7,51)-(7,56)
(8,8)-(8,69)
(8,20)-(8,28)
(8,20)-(8,44)
(8,29)-(8,44)
*)

(* type error slice
(7,8)-(8,69)
(7,20)-(7,56)
(7,41)-(7,45)
(8,48)-(8,54)
(8,48)-(8,69)
(8,55)-(8,69)
(8,56)-(8,61)
(9,11)-(9,27)
(9,12)-(9,18)
(9,19)-(9,26)
(9,20)-(9,22)
*)
