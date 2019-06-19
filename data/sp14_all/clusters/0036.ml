LetG NonRec [(VarPatG,BopG EmptyG EmptyG)] (BopG EmptyG EmptyG)
let sum =
  fst a + ((fst x + snd x) mod 10) in
(sum / 10 , sum mod 10)
let z = fst x + snd x in
match a with
| (w , y) -> ((w + z) / 10 , ((w + z) mod 10) :: y)
let depth = depth - 1 in
match rand (0 , 4) with
| 0 -> buildSine (build (rand , depth))
| 1 -> buildCosine (build (rand , depth))
| 2 -> buildAverage (build (rand , depth) , build (rand , depth))
| 3 -> buildTimes (build (rand , depth) , build (rand , depth))
| 4 -> buildThresh (build (rand , depth) , build (rand , depth) , build (rand , depth) , build (rand , depth))
let sum =
  num + additivePersistence num in
1 + additivePersistence num
let l1G =
  List.length l1 - List.length l2 in
(l1 , List.append (clone 0
                         l1G) l2)
let l2G =
  List.length l2 - List.length l1 in
(List.append (clone 0 l2G)
             l1 , l2)
let x = reverseInt n 0 / 10
and y =
  reverseInt n 0 mod 10 in
if (x = 0) && (y = 0)
then []
else y :: (digitsOfInt x)
