LetG NonRec [IteG EmptyG EmptyG EmptyG] (IteG EmptyG EmptyG EmptyG)
let larger =
  if List.length l1 > List.length l2
  then l1
  else l2 in
if List.length acc = List.length larger
then if rem = 1
     then (0 , [1 ; 0] @ acc)
     else (0 , acc)
else (let (el1 , el2) = x in
      let new_sum =
        (rem + el1) + el2 in
      let new_rem =
        if new_sum > 9
        then 1
        else 0 in
      let norm_sum =
        if new_sum > 9
        then new_sum - 10
        else new_sum in
      (new_rem , norm_sum :: acc))
let larger =
  if List.length l1 > List.length l2
  then l1
  else l2 in
if List.length acc = List.length larger
then if rem = 1
     then (0 , [1 ; 0] @ acc)
     else (0 , acc)
else (let (el1 , el2) = x in
      let new_sum =
        (rem + el1) + el2 in
      let new_rem =
        if new_sum > 9
        then 1
        else 0 in
      let norm_sum =
        if new_sum > 9
        then new_sum - 10
        else new_sum in
      (new_rem , norm_sum :: acc))
