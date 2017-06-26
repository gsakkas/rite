
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then h :: seen in
        let rest' = failwith "to be written" in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if (List.mem h seen) = false then h :: seen else seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,20)-(7,63)
(8,20)-(8,28)
(8,20)-(8,44)
(8,29)-(8,44)
*)

(* type error slice
(7,20)-(7,63)
(7,54)-(7,63)
*)

(* all spans
(2,21)-(9,27)
(3,2)-(9,27)
(3,18)-(8,69)
(4,4)-(8,69)
(4,10)-(4,14)
(5,12)-(5,16)
(7,8)-(8,69)
(7,20)-(7,63)
(7,23)-(7,48)
(7,23)-(7,40)
(7,24)-(7,32)
(7,33)-(7,34)
(7,35)-(7,39)
(7,43)-(7,48)
(7,54)-(7,63)
(7,54)-(7,55)
(7,59)-(7,63)
(8,8)-(8,69)
(8,20)-(8,44)
(8,20)-(8,28)
(8,29)-(8,44)
(8,48)-(8,69)
(8,48)-(8,54)
(8,55)-(8,69)
(8,56)-(8,61)
(8,63)-(8,68)
(9,2)-(9,27)
(9,2)-(9,10)
(9,11)-(9,27)
(9,12)-(9,18)
(9,19)-(9,26)
(9,20)-(9,22)
(9,24)-(9,25)
*)
