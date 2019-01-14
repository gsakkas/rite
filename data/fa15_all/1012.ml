
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
[h]
ListG VarG Nothing

*)
