LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)
let x = last l in
let y = removeLast l in
x :: (listReverse y)
let first = List.length l1 in
let sec = List.length l2 in
if first < sec
then (List.append (clone 0
                         (sec - first)) l1 , l2)
else if first > sec
     then (l1 , List.append (clone 0
                                   (first - sec)) l2)
     else (l1 , l2)
let ll1 = List.length l1 in
let ll2 = List.length l2 in
(clone 0
       (ll2 - ll1) @ l1 , clone 0
                                (ll1 - ll2) @ l2)
