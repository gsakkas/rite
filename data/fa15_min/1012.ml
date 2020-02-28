
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
          (let seen' = append (seen, h) in
           let rest' = t in helper (seen', rest')) in
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
(14,38)-(14,39)
[h]
ListG [VarG]

*)

(* type error slice
(3,3)-(3,67)
(3,36)-(3,67)
(3,44)-(3,45)
(3,44)-(3,50)
(3,54)-(3,60)
(3,54)-(3,67)
(3,61)-(3,67)
(3,62)-(3,63)
(3,65)-(3,66)
(10,17)-(10,25)
(10,17)-(10,32)
(10,26)-(10,27)
(10,28)-(10,32)
(14,24)-(14,30)
(14,24)-(14,40)
(14,31)-(14,40)
(14,32)-(14,36)
(14,38)-(14,39)
*)
