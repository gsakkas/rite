CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG]))])
match l with
| h :: t -> assoc (d , k , t)
match l with
| h :: t -> assoc (d , k , t)
match l with
| h :: t -> assoc (d , k , t)
match l with
| h :: t -> assoc (d , k , t)
match l with
| h :: t -> assoc (d , k , t)
match r with
| 3 -> buildAverage (build (rand , d - 1) , build (rand , d - 1))
| 4 -> buildTimes (build (rand , d - 1) , build (rand , d - 1))
| 5 -> buildThresh (build (rand , d - 1) , build (rand , d - 1) , build (rand , d - 1) , build (rand , d - 1))
match n with
| n -> incre n
match n with
| n -> incre n
match n with
| n -> incre n
match r with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 1) , buildY ())
| 3 -> buildTimes (build (rand , depth - 1) , buildX ())
| 4 -> buildThresh (build (rand , depth - 1) , buildX () , buildY () , buildX ())
| 5 -> buildSinCos (build (rand , depth - 1))
