
let rec assoc (d,k,l) =
  match (d, k, l) with
  | [] -> 0
  | (d,k,l) ->
      if l = []
      then d
      else
        (match l with
         | h::t ->
             (match h with | (a,b) -> if a = k then b else assoc (d, k, t)));;


(* fix

let rec assoc (d,k,l) =
  match (d, k, l) with
  | (d,k,l) ->
      if l = []
      then d
      else
        (match l with
         | h::t ->
             (match h with | (a,b) -> if a = k then b else assoc (d, k, t)));;

*)

(* changed spans
(3,3)-(11,77)
match (d , k , l) with
| (d , k , l) -> if l = []
                 then d
                 else (match l with
                       | h :: t -> match h with
                                   | (a , b) -> if a = k
                                                then b
                                                else assoc (d , k , t))
CaseG (fromList [(TuplePatG (fromList [VarPatG]),Nothing,IteG EmptyG EmptyG EmptyG)])

(4,11)-(4,12)
if l = []
then d
else (match l with
      | h :: t -> match h with
                  | (a , b) -> if a = k
                               then b
                               else assoc (d , k , t))
IteG (BopG EmptyG EmptyG) VarG (CaseG (fromList [(ConsPatG EmptyPatG EmptyPatG,Nothing,EmptyG)]))

*)

(* type error slice
(3,3)-(11,77)
(3,9)-(3,18)
*)
