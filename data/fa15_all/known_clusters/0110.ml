LetG NonRec (fromList [BopG EmptyG EmptyG]) (IteG EmptyG EmptyG EmptyG)
let sum = fst x + snd x in
if sum > 9
then (1 , ((sum - 10) + fst a) :: (snd a))
else (0 , (sum + fst a) :: (snd a))
let sum = fst x + snd x in
if sum > 9
then (1 , ((sum - 10) + fst a) :: (snd a))
else (0 , (sum + fst a) :: (snd a))
let sum = fst x + snd x in
if sum > 9
then (1 , ((sum - 10) + fst a) :: (snd a))
else (0 , (sum + fst a) :: (snd a))
let sum = fst x + snd x in
if sum > 9
then (1 , ((sum - 10) + fst a) :: (snd a))
else (0 , (sum + fst a) :: (snd a))
let sizDif =
  List.length l1 - List.length l2 in
if sizDif > 0
then (let pad =
        clone 0 sizDif in
      (l1 , pad @ l2))
else (let pad =
        clone 0 (- sizDif) in
      (pad @ l1 , l2))
let sizDif =
  List.length l1 - List.length l2 in
if sizDif > 0
then (let pad =
        clone 0 sizDif in
      (l1 , pad @ l2))
else (let pad =
        clone 0 (- sizDif) in
      (pad @ l1 , l2))
let sizDif =
  List.length l1 - List.length l2 in
if sizDif > 0
then (let pad =
        clone 0 sizDif in
      (l1 , pad @ l2))
else (let pad =
        clone 0 (- sizDif) in
      (pad @ l1 , l2))
let z = (o + p) + m in
if z > 9
then (1 , (z - 10) :: n)
else (0 , z :: n)
let z = (o + p) + m in
if z > 9
then (1 , (z - 10) :: n)
else (0 , z :: n)
let z = (o + p) + m in
if z > 9
then (1 , (z - 10) :: n)
else (0 , z :: n)
