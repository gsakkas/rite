IteG (LetG NonRec (fromList [EmptyG]) EmptyG) (LetG NonRec (fromList [EmptyG]) EmptyG) (LetG NonRec (fromList [EmptyG]) EmptyG)
if (let (carry , ans) = a in
    let (y , z) = x in
    ((y + z) + carry) > 9)
then (let (carry , ans) = a in
      (1 , let (y , z) = x in
           [((y + z) + carry) mod 10] @ ans))
else (let (carry , ans) = a in
      (0 , let (y , z) = x in
           [(y + z) + carry] @ ans))
if (let (carry , ans) = a in
    let (y , z) = x in
    ((y + z) + carry) > 9)
then (let (carry , ans) = a in
      (1 , let (y , z) = x in
           [((y + z) + carry) mod 10] @ ans))
else (let (carry , ans) = a in
      (0 , let (y , z) = x in
           [(y + z) + carry] @ ans))
if (let (carry , ans) = a in
    let (y , z) = x in
    ((y + z) + carry) > 9)
then (let (carry , ans) = a in
      (1 , let (y , z) = x in
           [((y + z) + carry) mod 10] @ ans))
else (let (carry , ans) = a in
      (0 , let (y , z) = x in
           [(y + z) + carry] @ ans))
