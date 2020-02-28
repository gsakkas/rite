
let rec filter l a =
  match l with
  | [] -> []
  | h::t -> if a = h then filter t a else h :: (filter t a);;

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h in
        let rest' = h :: (filter (t h)) in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let rec filter l a =
  match l with
  | [] -> []
  | h::t -> if h = a then filter t a else h :: (filter t a);;

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h :: seen in
        let rest' = filter t h in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(5,16)-(5,17)
h
VarG

(5,20)-(5,21)
a
VarG

(12,21)-(12,22)
h :: seen
AppG [VarG,VarG]

(13,21)-(13,40)
filter t h
AppG [VarG,VarG]

*)

(* type error slice
(5,48)-(5,60)
(5,49)-(5,55)
(9,5)-(13,65)
(13,21)-(13,40)
(13,26)-(13,40)
(13,27)-(13,33)
(13,34)-(13,39)
(13,35)-(13,36)
*)
