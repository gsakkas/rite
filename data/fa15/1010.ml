
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
(2,21)-(12,16)
(11,23)-(11,32)
(11,24)-(11,28)
(11,30)-(11,31)
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
(11,10)-(11,75)
(11,23)-(11,32)
(11,24)-(11,28)
(11,30)-(11,31)
(11,53)-(11,59)
(11,53)-(11,74)
(11,60)-(11,74)
(11,61)-(11,66)
*)

(* all spans
(2,21)-(12,16)
(3,2)-(12,16)
(3,18)-(11,75)
(4,4)-(11,75)
(4,10)-(4,14)
(5,12)-(5,16)
(7,8)-(11,75)
(7,16)-(7,31)
(7,16)-(7,24)
(7,25)-(7,26)
(7,27)-(7,31)
(8,8)-(11,75)
(8,11)-(8,12)
(9,13)-(9,29)
(9,13)-(9,19)
(9,20)-(9,29)
(9,21)-(9,25)
(9,27)-(9,28)
(11,10)-(11,75)
(11,23)-(11,32)
(11,24)-(11,28)
(11,30)-(11,31)
(11,36)-(11,74)
(11,48)-(11,49)
(11,53)-(11,74)
(11,53)-(11,59)
(11,60)-(11,74)
(11,61)-(11,66)
(11,68)-(11,73)
(12,2)-(12,16)
(12,2)-(12,8)
(12,9)-(12,16)
(12,10)-(12,12)
(12,14)-(12,15)
*)
