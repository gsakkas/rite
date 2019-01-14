
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
y
VarG

(2,21)-(12,16)
x
VarG

(2,21)-(12,16)
h
VarG

(2,21)-(12,16)
x
VarG

(2,21)-(12,16)
append
VarG

(2,21)-(12,16)
z
VarG

(2,21)-(12,16)
t
VarG

(2,21)-(12,16)
fun (x , y) ->
  match y with
  | [] -> x
  | h :: t -> (let z = h :: x in
               append (z , t))
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(2,21)-(12,16)
append (z , t)
AppG (fromList [TupleG (fromList [EmptyG])])

(2,21)-(12,16)
let z = h :: x in
append (z , t)
LetG NonRec (fromList [ConAppG (Just EmptyG) Nothing]) (AppG (fromList [EmptyG]))

(2,21)-(12,16)
match y with
| [] -> x
| h :: t -> (let z = h :: x in
             append (z , t))
CaseG VarG (fromList [(Nothing,VarG),(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])

(2,21)-(12,16)
(z , t)
TupleG (fromList [VarG])

(2,21)-(12,16)
h :: x
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(11,23)-(11,32)
append (seen , [h])
AppG (fromList [TupleG (fromList [EmptyG])])

(11,24)-(11,28)
append
VarG

(11,24)-(11,28)
(seen , [h])
TupleG (fromList [VarG,ListG EmptyG Nothing])

(11,30)-(11,31)
[h]
ListG VarG Nothing

*)
