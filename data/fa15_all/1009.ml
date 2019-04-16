
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let x = List.mem h seen in
        if x
        then helper (seen, t)
        else
          (let seen' = seen :: h in let rest' = t in helper (seen', rest')) in
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
(11,24)-(11,33)
seen @ [h]
AppG (fromList [VarG,ListG (fromList [EmptyG])])

*)

(* type error slice
(7,17)-(7,25)
(7,17)-(7,32)
(7,26)-(7,27)
(7,28)-(7,32)
(9,14)-(9,20)
(9,14)-(9,30)
(9,21)-(9,30)
(9,22)-(9,26)
(11,11)-(11,76)
(11,24)-(11,28)
(11,24)-(11,33)
(11,32)-(11,33)
(11,54)-(11,60)
(11,54)-(11,75)
(11,61)-(11,75)
(11,62)-(11,67)
*)
