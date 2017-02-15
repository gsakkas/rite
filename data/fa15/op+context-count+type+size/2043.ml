
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
(10,13)-(10,75)
(10,26)-(10,28)
(10,31)-(10,32)
(10,36)-(10,74)
*)

(* type error slice
(7,16)-(7,24)
(7,16)-(7,31)
(7,25)-(7,26)
(7,27)-(7,31)
(9,13)-(9,19)
(9,13)-(9,29)
(9,20)-(9,29)
(9,21)-(9,25)
(10,13)-(10,75)
(10,26)-(10,32)
(10,29)-(10,30)
(10,31)-(10,32)
(10,53)-(10,59)
(10,53)-(10,74)
(10,60)-(10,74)
(10,61)-(10,66)
*)
