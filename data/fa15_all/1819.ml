
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        let seen' = seen in
        (if 1 = 2 then seen' := (h :: seen');
         (let rest' = t in helper (seen', rest'))) in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let assignSeen h r seen = if List.mem h r then seen else h :: seen in
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        let seen' = assignSeen h r seen in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(3,2)-(11,27)
List.mem
VarG

(3,2)-(11,27)
h
VarG

(3,2)-(11,27)
r
VarG

(3,2)-(11,27)
seen
VarG

(3,2)-(11,27)
h
VarG

(3,2)-(11,27)
seen
VarG

(3,2)-(11,27)
fun h ->
  fun r ->
    fun seen ->
      if List.mem h r
      then seen
      else h :: seen
LamG (LamG EmptyG)

(3,2)-(11,27)
fun r ->
  fun seen ->
    if List.mem h r
    then seen
    else h :: seen
LamG (LamG EmptyG)

(3,2)-(11,27)
fun seen ->
  if List.mem h r
  then seen
  else h :: seen
LamG (IteG EmptyG EmptyG EmptyG)

(3,2)-(11,27)
List.mem h r
AppG (fromList [VarG])

(3,2)-(11,27)
let assignSeen =
  fun h ->
    fun r ->
      fun seen ->
        if List.mem h r
        then seen
        else h :: seen in
let rec helper =
  fun (seen , rest) ->
    match rest with
    | [] -> seen
    | h :: t -> (let r =
                   List.rev t in
                 let seen' =
                   assignSeen h r seen in
                 let rest' = t in
                 helper (seen' , rest')) in
List.rev (helper ([] , l))
LetG NonRec (fromList [LamG EmptyG]) (LetG Rec (fromList [EmptyG]) EmptyG)

(3,2)-(11,27)
if List.mem h r
then seen
else h :: seen
IteG (AppG (fromList [EmptyG])) VarG (ConAppG (Just EmptyG) Nothing)

(3,2)-(11,27)
h :: seen
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(9,9)-(9,44)
r
VarG

(9,32)-(9,44)
assignSeen h r seen
AppG (fromList [VarG])

(9,33)-(9,34)
assignSeen
VarG

(10,9)-(10,49)
seen
VarG

*)
