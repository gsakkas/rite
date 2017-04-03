
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let x = List.mem h seen in
        if x
        then helper (seen, t)
        else (let seen' = seen @ h in let rest' = t in helper (seen', rest')) in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let x = List.mem h seen in
        if x
        then helper (seen, t)
        else
          (let seen' = seen @ [h] in let rest' = t in helper (seen', rest')) in
  List.rev (helper ([], l));;

*)

(* changed spans
(10,33)-(10,34)
*)

(* type error slice
(7,16)-(7,24)
(7,16)-(7,31)
(7,25)-(7,26)
(7,27)-(7,31)
(10,26)-(10,30)
(10,26)-(10,34)
(10,31)-(10,32)
(10,33)-(10,34)
*)

(* all spans
(2,21)-(11,27)
(3,2)-(11,27)
(3,18)-(10,77)
(4,4)-(10,77)
(4,10)-(4,14)
(5,12)-(5,16)
(7,8)-(10,77)
(7,16)-(7,31)
(7,16)-(7,24)
(7,25)-(7,26)
(7,27)-(7,31)
(8,8)-(10,77)
(8,11)-(8,12)
(9,13)-(9,29)
(9,13)-(9,19)
(9,20)-(9,29)
(9,21)-(9,25)
(9,27)-(9,28)
(10,13)-(10,77)
(10,26)-(10,34)
(10,31)-(10,32)
(10,26)-(10,30)
(10,33)-(10,34)
(10,38)-(10,76)
(10,50)-(10,51)
(10,55)-(10,76)
(10,55)-(10,61)
(10,62)-(10,76)
(10,63)-(10,68)
(10,70)-(10,75)
(11,2)-(11,27)
(11,2)-(11,10)
(11,11)-(11,27)
(11,12)-(11,18)
(11,19)-(11,26)
(11,20)-(11,22)
(11,24)-(11,25)
*)
