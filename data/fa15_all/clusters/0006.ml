TupleG (fromList [VarG,AppG (fromList [EmptyG])])
(l1 @ clone 0 diff , l2)
(l1 , l2 @ clone 0 diff)
(l1 , clone 0 n @ l2)
(clone 0 (0 - n) @ l1 , l2)
(List.append (clone 0
                    (padLength l1 l2)) l1 , l2)
(l1 , List.append (clone 0
                         (padLength l1 l2)) l2)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
(clone 0 n @ l1 , l2)
(clone 0 n @ l2 , l1)
(padZero l1 l2 , l2)
(clone 0
       (List.length l1 - List.length l2) @ l2 , l1)
(l1 , clone 0 z @ l2)
(clone 0 z @ l1 , l2)
(0 :: l1 , l2)
(l1 , 0 :: l2)
(l1 , pad @ l2)
(pad @ l1 , l2)
(l1 , clone 0
            (len1 - len2) @ l2)
(clone 0 (0 - d) @ l1 , l2)
(l1 , clone 0 d @ l2)
(buildThresh (x7 , x8 , x9 , x0) , x , y)
(clone 0 (s2 - s1) , l2)
