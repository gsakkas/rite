
let rec filter (l,a) =
  match l with
  | [] -> []
  | hd::tl -> if hd = a then filter (tl, a) else hd :: (filter (tl, a));;

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h :: seen in
        let rest' = filter t h in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let rec filter l h =
  match l with
  | [] -> []
  | hd::tl -> if hd = h then hd :: (filter tl h) else filter tl h;;

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
(2,16)-(5,71)
fun l ->
  fun h ->
    match l with
    | [] -> []
    | hd :: tl -> if hd = h
                  then hd :: (filter tl h)
                  else filter tl h
LamG (LamG EmptyG)

(3,2)-(5,71)
fun h ->
  match l with
  | [] -> []
  | hd :: tl -> if hd = h
                then hd :: (filter tl h)
                else filter tl h
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(5,41)-(5,42)
h
VarG

(5,55)-(5,71)
filter tl h
AppG (fromList [VarG])

(5,68)-(5,69)
h
VarG

(7,21)-(14,27)
filter
VarG

(7,21)-(14,27)
tl
VarG

(7,21)-(14,27)
h
VarG

(7,21)-(14,27)
filter tl h
AppG (fromList [VarG])

*)
