
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let x = List.mem h seen in
        if x
        then helper (seen, t)
        else
          (let seen' = [seen; h] in let rest' = t in helper (seen', rest')) in
  helper ([], l);;


(* fix

let rec append (x,y) =
  match y with | [] -> x | h::t -> let z = h :: x in append (z, t);;

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let x = List.mem h seen in
        if x
        then helper (seen, t)
        else
          (let seen' = append (seen, [h]) in
           let rest' = t in helper (seen', rest')) in
  helper ([], l);;

*)

(* changed spans
(2,22)-(12,16)
(3,3)-(12,16)
(7,9)-(11,74)
(11,12)-(11,74)
(11,24)-(11,33)
(11,25)-(11,29)
(11,31)-(11,32)
(11,37)-(11,74)
(11,49)-(11,50)
(11,54)-(11,60)
(11,62)-(11,67)
(11,69)-(11,74)
(12,3)-(12,9)
(12,11)-(12,13)
(12,11)-(12,16)
(12,15)-(12,16)
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
(11,12)-(11,74)
(11,24)-(11,33)
(11,24)-(11,33)
(11,24)-(11,33)
(11,25)-(11,29)
(11,31)-(11,32)
(11,54)-(11,60)
(11,54)-(11,74)
(11,62)-(11,67)
(11,62)-(11,74)
*)
