
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
(14,37)-(14,38)
*)

(* type error slice
(3,2)-(3,66)
(3,2)-(3,66)
(3,35)-(3,66)
(3,43)-(3,44)
(3,43)-(3,49)
(3,43)-(3,49)
(3,53)-(3,59)
(3,53)-(3,66)
(3,60)-(3,66)
(3,61)-(3,62)
(3,64)-(3,65)
(10,16)-(10,24)
(10,16)-(10,31)
(10,25)-(10,26)
(10,27)-(10,31)
(14,23)-(14,29)
(14,23)-(14,39)
(14,30)-(14,39)
(14,31)-(14,35)
(14,37)-(14,38)
*)
