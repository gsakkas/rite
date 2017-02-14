
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let x = List.mem h seen in
        if x
        then helper (seen, t)
        else (let seen' = [] @ h in let rest' = t in helper (seen', rest')) in
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
(10,15)-(10,74)
(10,27)-(10,29)
(10,32)-(10,33)
(10,37)-(10,74)
*)

(* type error slice
(7,17)-(7,25)
(7,17)-(7,32)
(7,26)-(7,27)
(7,28)-(7,32)
(9,14)-(9,20)
(9,14)-(9,29)
(9,22)-(9,26)
(9,22)-(9,29)
(10,15)-(10,74)
(10,27)-(10,33)
(10,30)-(10,31)
(10,32)-(10,33)
(10,54)-(10,60)
(10,54)-(10,74)
(10,62)-(10,67)
(10,62)-(10,74)
*)
